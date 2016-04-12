require 'rails_helper'

describe 'creating a new course' do
  before :each do
    FactoryGirl.create :user
    FactoryGirl.create :user, username:'tavis', admin:false
  end

  it 'is successful when user is admin and information is correct' do
    login('vlakanie', 'lollero1')

    visit new_course_path

    fill_in 'course_name', with:'asd'
    fill_in 'course_week_count', with:'4'

    click_button 'Create Course'

    expect(page).to have_content 'Course created successfully'
    expect(page).to have_content 'Leader: vlakanie'
    expect(Week.count).to eq(5)
    expect(CodereviewGroup.count).to eq(1)
  end

  it 'is unsuccessful when the user is admin and information is incorrect' do
    login('vlakanie', 'lollero1')

    visit new_course_path

    fill_in 'course_irc_channel', with:'#asd'
    fill_in 'course_week_count', with:'0'

    click_button 'Create Course'

    expect(page).to have_content 'Name can\'t be blank'
    expect(page).to have_content 'Week count must be greater than or equal to 1'
    expect(Week.count).to eq(0)
    expect(CodereviewGroup.count).to eq(0)
    expect(Course.count).to eq(0)
  end

  it 'is unsuccessful when user is not admin' do
    login('tavis', 'lollero1')

    visit new_course_path

    expect(page).to have_content 'You need admin access to do that!'
  end
end
