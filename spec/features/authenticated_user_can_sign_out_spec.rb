require 'rails_helper'

RSpec.describe 'Authenticated users' do
  let(:user) { create(:user) }
  it 'can sign out and return to the landing page' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit dashboard_path
    click_on 'Sign Out'
    expect(current_path).to eq(root_path)
    expect(page).to have_selector(:css, '.alert.alert-success')
  end
end