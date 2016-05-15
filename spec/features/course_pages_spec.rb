require 'rails_helper'

describe 'Courses' do
  before :each do
    user = FactoryGirl.create :user, username:'vlakanie'
    @course = FactoryGirl.create :course, name:'tsoha', description:'kiva kurssi', irc_channel:'#tsoha', leader: user
    @course.current_week = FactoryGirl.create :current_week, course:@course
    @course.save

    normal_user = FactoryGirl.create :user, username:'mluukkai'
    participation = FactoryGirl.create :participation, user:normal_user, course:@course

    (1..6).each do |i|
      week = FactoryGirl.create :week, course:@course, number:i
      WeeklySubmission.create participation:participation, week:week, points:4-i unless i > 3
    end

    login 'mluukkai', 'lollero1'
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

  it 'shows weekly points correctly in point matrix' do
    visit course_path(@course)

    expect(week_td(1)).to have_content '3.0 / 3'
    expect(week_td(2)).to have_content '2.0 / 3'
    expect(week_td(3)).to have_content '1.0 / 3'
    expect(week_td(4)).to have_content '- / 3'
    expect(week_td(5)).to have_content '- / 3'
    expect(week_td(6)).to have_content '- / 3'
  end
end

def week_td(week)
  find('tbody').find("td:nth-child(#{week})")
end