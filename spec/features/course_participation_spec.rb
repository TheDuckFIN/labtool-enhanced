require 'rails_helper'

describe 'Participations' do

  before :each do
    @course = FactoryGirl.create :course, name:'javalabra'
    FactoryGirl.create :user, username:'tavis'

    login('tavis', 'lollero1')
  end

  it 'joining course is successful with correct repository url and topic' do
    visit join_course_path(@course)

    fill_in 'participation_repository', with: 'https://github.com/DatabaseCleaner/database_cleaner'
    fill_in 'participation_topic', with: 'Databasen putsaaja railsille'

    click_button 'Create Participation'

    expect(page).to have_content 'Welcome to course!'
  end

  it 'joining course is unsuccessful with incorrect repository url' do
    visit join_course_path(@course)

    fill_in 'participation_repository', with: 'sadsa'
    fill_in 'participation_topic', with: 'Databasen putsaaja railsille'

    click_button 'Create Participation'

    expect(page).to have_content 'Repository is not a valid URL'
  end

  it 'joining course is unsuccessful when topic is empty' do
    visit join_course_path(@course)

    fill_in 'participation_repository', with: 'https://github.com/DatabaseCleaner/database_cleaner'

    click_button 'Create Participation'

    expect(page).to have_content "Topic can't be blank"
  end

  it 'leaving course is successful if participating', js: true do
    visit join_course_path(@course)

    fill_in 'participation_repository', with: 'https://github.com/DatabaseCleaner/database_cleaner'
    fill_in 'participation_topic', with: 'Databasen putsaaja railsille'

    click_button 'Create Participation'

    expect(page).to have_content 'Welcome to course!'

    click_link 'Leave course'

    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content 'Successfully left the course!'
  end

end