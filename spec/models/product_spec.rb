require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name, price, quantity, and category' do
      @category = Category.create(name: "Shoes")
      @product = Product.new(
        name: "Air Jordan I",
        price: 200,
        quantity: 11,
        category_id: @category.id
      )
      expect(@product).to be_valid
    end

    it 'should not be valid when name is nil' do
      @category = Category.create(name: "Shoes")
      @product = Product.new(
        name: nil,
        price: 200,
        quantity: 11,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'should not be valid when price is nil' do
      @category = Category.create(name: "Shoes")
      @product = Product.new(
        name: "Air Jordan I",
        price: nil,
        quantity: 11,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'should not be valid when quantity is nil' do
      @category = Category.create(name: "Shoes")
      @product = Product.new(
        name: "Air Jordan I",
        price: 200,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'should not be valid when category is nil' do
      @category = Category.create(name: "Shoes")
      @product = Product.new(
        name: "Air Jordan I",
        price: 200,
        quantity: 11,
        category_id: nil
      )
      expect(@product).to_not be_valid
    end
  end
end
