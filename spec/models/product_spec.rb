require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it('should be valid if product name, price, category, quantity is present') do
      category = Category.new(name: 'apparel')
      name = Product.new(name: 'a', price_cents: 40, category: category, quantity: 1)
      expect(name).to(be_valid)
    end
  end

  describe 'Validations' do
    it('should be invalid if product name is not present') do
      category = Category.new(name: 'apparel')
      name = Product.new(price_cents: 40, category: category, quantity: 1)
      expect(name).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if price is not present') do
      category = Category.new(name: 'apparel')
      price = Product.new(name: 'a', category: category, quantity: 1)
      expect(price).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if quantity is not present') do
      category = Category.new(name: 'apparel')
      quantity = Product.new(name: 'a', price_cents: 40, category: category)
      expect(quantity).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if category is not present') do
      category = Category.new(name: 'apparel')
      quantity = Product.new(name: 'a', price_cents: 40, quantity: 1)
      expect(quantity).to_not be_valid
    end
  end
end
