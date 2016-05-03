require 'rails_helper'

describe 'Course adminstration' do
  before :each do
    user = FactoryGirl.create :admin, username:'vlakanie'
    FactoryGirl.create :user, username:'maukka'
    FactoryGirl.create :user, username:'jorma'

    @course = FactoryGirl.create :course, name:'tsoha', description:'kiva kurssi', irc_channel:'#tsoha', leader: user

    login 'vlakanie', 'lollero1'
  end

  it 'editing course general info with correct information is successful' do
    edit_course 'ohtu', 'miniprojekti jee!', '#lol'

    expect(page).to have_content 'Course updated successfully'

    expect(page).to have_content 'ohtu'
    expect(page).to have_content 'Description: miniprojekti jee!'
    expect(page).to have_content 'IRC channel: #lol'
  end

  it 'editing course general info with incorrect information is unsuccessful' do
    edit_course '', 'miniprojekti jee!', '#lol'

    expect(page).to have_content "Name can't be blank"
  end

  it 'adding teacher works', js: true do
    visit edit_course_path(@course)

    expect(page).not_to have_content 'maukka'
    expect(page).not_to have_content 'jorma'

    add_teacher 'mau'

    expect(page).to have_content 'maukka'
    expect(page).not_to have_content 'jorma'

    add_teacher 'jor'

    expect(page).to have_content 'maukka'
    expect(page).to have_content 'jorma'
  end

  it 'removing teacher works', js: true do
    visit edit_course_path(@course)

    expect(page).not_to have_content 'maukka'

    add_teacher 'mau'

    expect(page).to have_content 'maukka'

    click_link 'Remove teacher'

    expect(page).not_to have_content 'maukka'
  end

  def add_teacher(name)
    fill_in 'teachersearch', with: name
    click_button 'Add teacher'
  end

  def edit_course(name, desc, irc)
    visit course_path(@course)

    expect(page).to have_content 'tsoha'
    expect(page).to have_content 'Description: kiva kurssi'
    expect(page).to have_content 'IRC channel: #tsoha'
    expect(page).to have_content 'Leader: vlakanie'

    click_link 'Settings'

    fill_in 'course_name', with: name
    fill_in 'course_description', with: desc
    fill_in 'course_irc_channel', with: irc

    click_button 'Update Course'
  end
end