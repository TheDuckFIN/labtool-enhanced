require 'rails_helper'

describe 'Courses' do
  before :each do
    user = FactoryGirl.create :user, username:'vlakanie'
    @course = FactoryGirl.create :course, name:'tsoha', description:'kiva kurssi', irc_channel:'#tsoha', leader: user

    login 'vlakanie', 'lollero1'
  end

  it 'in listing page all active courses are shown' do
    visit courses_path

    expect(page).to have_content 'tsoha'
    expect(page).to have_content 'vlakanie'
  end

  it 'page shows course info' do
    visit course_path(@course)

    expect(page).to have_content 'tsoha'
    expect(page).to have_content 'Description: kiva kurssi'
    expect(page).to have_content 'IRC channel: #tsoha'
    expect(page).to have_content 'Leader: vlakanie'
  end
end