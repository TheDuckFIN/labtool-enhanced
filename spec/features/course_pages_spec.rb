require 'rails_helper'

describe 'Courses' do
  before :each do
    user = FactoryGirl.create :user, username:'vlakanie'
    @course = FactoryGirl.create :course, name:'tsoha', leader: user

    visit login_path
    fill_in 'username', with:'vlakanie'
    fill_in 'password', with:'lollero1'
    click_button 'Log in'
  end

  it 'in listing page all active courses are shown' do
    visit courses_path

    expect(page).to have_content 'tsoha'
    expect(page).to have_content 'vlakanie'
  end

  it 'page shows course info' do
    visit course_path(@course)

    expect(page).to have_content 'tsoha'
  end
end