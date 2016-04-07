require 'rails_helper'

describe 'Controller pages' do
  before :each do
    @user = FactoryGirl.create :user
    @course = FactoryGirl.create :course, leader: @user

    visit login_path
    fill_in 'username', with:'vlakanie'
    fill_in 'password', with:'lollero1'
    click_button 'Log in'
  end

  it 'courses list page lists all courses' do
    visit courses_path

    expect(page).to have_content 'tsoha'
    expect(page).to have_content 'vlakanie'
  end

  it 'single course page shows course info' do
    visit course_path(@course)

    expect(page).to have_content 'tsoha'
  end
end