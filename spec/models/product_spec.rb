require 'rails_helper'

RSpec.describe Product, type: :model do

  before do
    @category = Category.create(name: "Shoes")
  end

  describe 'Validations' do
    it 'should have a name, price, quantity, and category' do

      @product = Product.new(
        name: "Air Jordan I",
        price: 200,
        quantity: 11,
        category_id: @category.id
      )
      expect(@product).to be_valid
    end

    it 'should not be valid when name is nil' do

      @product = Product.new(
        name: nil,
        price: 200,
        quantity: 11,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not be valid when price is nil' do

      @product = Product.new(
        name: "Air Jordan I",
        price: nil,
        quantity: 11,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not be valid when quantity is nil' do

      @product = Product.new(
        name: "Air Jordan I",
        price: 200,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not be valid when category is nil' do

      @product = Product.new(
        name: "Air Jordan I",
        price: 200,
        quantity: 11,
        category_id: nil
      )
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
