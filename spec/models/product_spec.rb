require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have all four fields set' do
      @category = Category.new(name: "Tester Cat")
      @product = @category.products.new({
        name: "Tester Prod",
        price: 12.34,
        quantity: 22
      })
      expect(@product).to be_valid 
    end

    it 'should have a valid name' do
      @category = Category.new(name: "Tester Cat")
      @product = @category.products.new({
        name: nil,
        price: 12.34,
        quantity: 22
      })
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include "Name can't be blank"
    end

    it 'should have a valid price' do
      @category = Category.new(name: "Tester Cat")
      @product = @category.products.new({
        name: "Tester Prod",
        price: nil,
        quantity: 22
      })
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include "Price can't be blank"
    end

    it 'should have a valid quantity' do
      @category = Category.new(name: "Tester Cat")
      @product = @category.products.new({
        name: "Tester Prod",
        price: 12.34,
        quantity: nil
      })
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include "Quantity can't be blank"
    end

    it 'should have a valid category' do
      @category = nil
      @product = Product.new({
        name: "Tester Prod",
        price: 12.34,
        quantity: 22, 
        category: nil
      })
      expect(@product).to be_invalid
      expect(@product.errors.full_messages).to include "Category can't be blank"
    end
  end
end
