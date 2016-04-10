require 'rails_helper'

describe 'users list page' do
  before :each do
    FactoryGirl.create :user
    FactoryGirl.create :user, username:'Asdffsdf'
    
    visit login_path
    fill_in 'username', with:'vlakanie'
    fill_in 'password', with:'lollero1'
    click_button 'Log in'
  end

  it 'users are listed correctly' do
    visit users_path

    expect(page).to have_content 'vlakanie'
    expect(page).to have_content 'Asdffsdf'
  end
end