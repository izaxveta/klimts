require 'rails_helper'

RSpec.describe 'Authenticated Admin User' do
  let(:admin) { create(:admin) }

  it 'can add a new listing' do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit '/admin/products/new'
    expect(Product.count).to eq(0)
    fill_in 'product_name', with: 'Vampire Blood (.25oz)'
    fill_in 'product_price', with: 100000
    fill_in 'product_description', with: 'Vampire blood from The Vampire Queen of Louisiana'
    fill_in 'product_quantity', with: 4
    select 'In Stock', from:'product_status'
    click_on 'Add New Item'

    expect(Product.count).to eq(1)
    expect(current_path).to eq('/admin/products')
    expect(page).to have_content('Vampire Blood (.25oz)')
    within(:css, '.alert.alert-success') do
      expect(page).to have_content('Added new product: Vampire Blood (.25oz)')
    end
    expect(page).to have_selector(:css, '.alert.alert-success')
    expect(page).to have_css('.product-item', count: 1)
  end
end