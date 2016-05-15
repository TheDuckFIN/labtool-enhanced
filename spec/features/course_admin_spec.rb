require 'rails_helper'

describe 'Course admin' do
  before :each do
    leader = FactoryGirl.create :admin, username:'vlakanie'
    FactoryGirl.create :user, username:'maukka'
    FactoryGirl.create :user, username:'jorma'

    @course = FactoryGirl.create :course, name:'tsoha', description:'kiva kurssi', irc_channel:'#tsoha', leader:leader
    @course.current_week = FactoryGirl.create :current_week, course:@course
    @course.save

    (1..6).each do |i|
      FactoryGirl.create :week, course:@course, number:i
    end

    3.times do
      user = FactoryGirl.create :user
      FactoryGirl.create :participation, user:user, course:@course
    end

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

  it 'giving a review works' do
    visit review_students_course_path(@course)

    click_link 'Begin course'

    expect(page).not_to have_content 'Points given: 2.0'
    expect(WeeklySubmission.count).to eq(0)

    table_row(3).click_link 'Review student'

    fill_in 'weekly_submission_points', with: '2.0'

    click_button 'Create Weekly submission'

    expect(table_row(1)).to have_content 'Not reviewed'
    expect(table_row(2)).to have_content 'Not reviewed'
    expect(table_row(3)).to have_content 'Points given: 2.0'
    expect(WeeklySubmission.count).to eq(1)
  end

  it 'editing a review works' do
    visit review_students_course_path(@course)

    click_link 'Begin course'

    expect(table_row(2)).to have_content 'Not reviewed'

    table_row(2).click_link 'Review student'
    fill_in 'weekly_submission_points', with: '2.0'
    click_button 'Create Weekly submission'

    expect(table_row(2)).to have_content 'Points given: 2.0'

    table_row(2).click_link 'Edit submission'
    fill_in 'weekly_submission_points', with: '2.5'
    click_button 'Update Weekly submission'

    expect(table_row(2)).to have_content 'Points given: 2.5'
  end

  it 'editing week works' do
    visit manage_weeks_course_path(@course)

    expect(table_row(3).find('td:nth-child(2)')).to have_content '3'

    table_row(3).click_link 'Edit'
    fill_in 'week_max_points', with:'5'
    click_button 'Update Week'

    expect(table_row(3).find('td:nth-child(2)')).to have_content '5'

    table_row(3).click_link 'Edit'
    fill_in 'week_max_points', with:'-1'
    click_button 'Update Week'

    expect(page).to have_content 'Max points must be greater than or equal to 0'
  end

end

def table_row(number)
  find('tbody').find("tr:nth-child(#{number})")
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

  click_link 'General settings'

  fill_in 'course_name', with: name
  fill_in 'course_description', with: desc
  fill_in 'course_irc_channel', with: irc

  click_button 'Update Course'
end