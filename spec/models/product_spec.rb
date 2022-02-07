require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do 
    it "should have a name" do

      @category = Category.new
      @category.name = "Tubers"
      @category.save
      @product = Product.new
      @product.name = 'potato'
      @product.description = 'a small potato'
      @product.price_cents = 10000
      @product.quantity = 34
      @product.category_id = @category[:id]
      @product.save
      expect(@product.name).to be_present
      expect(@product.price).to be_present
      expect(@product.quantity).to be_present
      expect(@product.category).to be_present

    end
    it "should throw an error when name is not provided" do
      @category = Category.new
      @category.name = "Tubers"
      @category.save
      @product = Product.new
      @product.description = 'a small potato'
      @product.price_cents = 10000
      @product.quantity = 34
      @product.category_id = @category[:id]
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "should throw an error when price is not provided" do
      @category = Category.new
      @category.name = "Tubers"
      @category.save
      @product = Product.new
      @product.name = 'potato'
      @product.description = 'a small potato'
      @product.quantity = 34
      @product.category_id = @category[:id]
      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "should throw an error when quantity is not provided" do
      @category = Category.new
      @category.name = "Tubers"
      @category.save
      @product = Product.new
      @product.name = 'potato'
      @product.description = 'a small potato'
      @product.price_cents = 10000
      @product.category_id = @category[:id]
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should throw an error when a category is not provided" do
      @category = Category.new
      @category.name = "Tubers"
      @category.save
      @product = Product.new
      @product.name = 'potato'
      @product.description = 'a small potato'
      @product.price_cents = 10000
      @product.quantity = 34
      @product.save
      puts @product.errors.full_messages.inspect

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end 
end
