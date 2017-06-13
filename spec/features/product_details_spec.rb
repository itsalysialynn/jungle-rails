require 'rails_helper'

RSpec.feature "users can navigate to the product detail page", type: :feature do
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


  scenario "They see the product details page when a product is clicked" do
    # ACT
    visit root_path
    
    first('article.product').find_link('Details »').click

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end
