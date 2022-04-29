require 'rails_helper'

RSpec.feature "Visitor navigates home page to product detail", type: :feature, js: true do
    # SETUP
  before:each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end  
  end

    scenario "They should see the product details" do
    # ACT
    visit root_path
    first('.btn-default').click
    # DEBUG / VERIFY
    expect(page).to have_link 'Apparel', href: '/categories/1'
    save_screenshot
  end
end