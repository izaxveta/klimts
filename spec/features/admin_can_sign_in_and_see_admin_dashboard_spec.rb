require 'rails_helper'

RSpec.describe 'Registered Admin User' do
  let(:admin) { create(:admin) }
  it 'can sign in and view the admin dashboard' do
    visit '/'
    click_on 'Sign In'
    fill_in 'session_email', with: admin.email
    fill_in 'session_password', with: admin.password
    within(:css, '.form__template') { click_on 'Submit' }

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_selector(:css, '.alert.alert-success')
  end
end