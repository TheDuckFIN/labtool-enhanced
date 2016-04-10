require 'rails_helper'

describe 'creating a new user' do

  it 'is successful with correct information' do
    visit register_path

    fill_in 'user_username', with: 'Pekka'
    fill_in 'user_student_number', with: '012345678'
    fill_in 'user_password', with: 'lollero1'
    fill_in 'user_password_confirmation', with: 'lollero1'
    fill_in 'user_email', with: 'my@email.com'

    click_button 'Create User'

    expect(page).to have_content 'Pekka'
    expect(page).to have_content 'User created successfully!'
  end

  it 'with incorrect information form is displayed with errors' do
    visit register_path

    fill_in 'user_username', with: 'as'
    fill_in 'user_student_number', with: '12345678'
    fill_in 'user_password', with: 'short'
    fill_in 'user_password_confirmation', with: 'lollero1'

    click_button 'Create User'

    expect(page).to have_content 'Username is too short (minimum is 3 characters)'
    expect(page).to have_content 'Student number is invalid (must be 9 digits and start with 0)'
    expect(page).to have_content 'Email can\'t be blank'
    expect(page).to have_content 'Password is too short (minimum is 8 characters)'
    expect(page).to have_content 'Confirm password doesn\'t match Password'
  end

end