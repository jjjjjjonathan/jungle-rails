require 'rails_helper'

RSpec.feature "Visitor adds item to cart", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product to cart" do
    #ACT
    visit root_path
    find('button.btn-primary', match: :first).click

    # VERIFY
    expect(page).to have_content('My Cart (1)')

    #DEBUG
    save_screenshot
  end
end
