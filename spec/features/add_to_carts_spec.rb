require 'rails_helper'

RSpec.feature "Cart increments when add to cart is pressed",, type: :feature, js: true do
  before :each do
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

scenario "add_product_to_cart" do
  visit root_path

  first('article.product').find_link('Add').click

  save_screenshot

  end
end