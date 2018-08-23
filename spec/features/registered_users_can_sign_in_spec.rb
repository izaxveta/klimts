require 'rails_helper'

RSpec.describe 'Registered users' do
  let(:user) { create(:user) }
  before :each do
    visit root_path
    click_on 'Sign In'
  end

  it 'can sign in using a link from the landing' do
    fill_in 'session_email', with: user.email
    fill_in 'session_password', with: user.password
    within(:css, '.form__template') { click_on 'Submit' }
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_selector(:css, '.alert.alert-success')
    expect(page).to have_content('success')
  end

  it 'will be redirected to sign in if they input the wrong credentials' do
    fill_in 'session_email', with: 'unregisteredemail'
    fill_in 'session_password', with: 'falsepassword'
    within(:css, '.form__template') { click_on 'Submit' }
    expect(current_path).to eq(signin_path)
    expect(page).to have_selector(:css, '.alert.alert-error')
    expect(page).to have_content('Invalid')
  end

  it 'all fields are required fields in order to sign in' do
    fill_in 'session_email', with: ''
    fill_in 'session_password', with: user.password
    within(:css, '.form__template') { click_on 'Submit' }
    expect(current_path).to eq(signin_path)
    expect(page).to have_selector(:css, '.alert.alert-error')
    expect(page).to have_content('Invalid')
  end
end