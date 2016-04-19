require 'rails_helper'

describe 'Login system' do
  before :each do
    FactoryGirl.create :user, username:'vlakanie'
  end

  it 'when logging in with correct credentials, login is successful' do
    login('vlakanie', 'lollero1')

    expect(page).to have_content 'Welcome back, vlakanie!'
  end

  it 'when logging in with incorrect password, login fails' do
    login('vlakanie', 'wrong')

    expect(page).to have_content 'Incorrect username or password! Please try again!'
  end

  it 'when logging in with incorrect credentials, login fails' do
    login('wrong', 'wrong')

    expect(page).to have_content 'Incorrect username or password! Please try again!'
  end

  it 'logs out successfully if logged in' do
    login('vlakanie', 'lollero1')

    click_link 'Log out'
    expect(page).to have_content 'Logged out successfully!'
  end
end
