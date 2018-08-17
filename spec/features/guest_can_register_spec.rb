require 'rails_helper'

RSpec.describe 'Guests' do
  before(:each) { visit '/' }

  it 'can visit the landing page' do
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Klimt's")
    expect(page).to have_link("Register")
  end

  it 'can register for an account' do
    click_on "Register"

    expect(current_path).to eq(register_path)

    fill_in 'user_email', with: 'eric.northman@mail.com'
    fill_in 'user_first_name', with: 'Eric'
    fill_in 'user_last_name', with: 'Northman'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Register'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('success')
  end

  it 'cannot register under an email that is already in use' do
    create(:user, email: 'jessica.hamby@mail.com')
    click_on "Register"
    fill_in 'user_email', with: 'jessica.hamby@mail.com'
    fill_in 'user_first_name', with: 'Jessica'
    fill_in 'user_last_name', with: 'Hamby'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Register'
    expect(current_path).to eq(register_path)
    expect(page).to have_selector(:css, '.alert.alert-error')
  end

  it 'must input an email in valid format when registering' do
    click_on "Register"
    fill_in 'user_email', with: 'jessica.hamby.mail.com'
    fill_in 'user_first_name', with: 'Jessica'
    fill_in 'user_last_name', with: 'Hamby'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Register'
    expect(current_path).to eq(register_path)
    expect(page).to have_content("Something went wrong.")
    expect(page).to have_selector(:css, '.alert.alert-error')
  end
end