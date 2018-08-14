require 'rails_helper'

RSpec.describe 'Guests' do
  it 'can visit the landing page' do
    visit '/'

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Klimt's")
    expect(page).to have_link("Register")
  end

  it 'can register for an account' do
    visit '/'
    click_on "Register"

    expect(current_path).to eq(new_user_path)

    fill_in 'user_email', with: 'eric.northman@mail.com'
    fill_in 'user_first_name', with: 'Eric'
    fill_in 'user_last_name', with: 'Northman'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_on 'Register'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('success')
  end
end