class Admin::CategoriesController < ApplicationController
  require 'dotenv/load'
  http_basic_authenticate_with :name => ENV["USER_NAME"], :password => ENV["PASSWORD"]

  def index
    @categories = Category.all
    @items_number = Category.joins(:products).group(:category_id).size
  end
  def new
    @category = Category.new
  end
  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Product created!'
    else
      render :new
    end
  end
  def category_params
    params.require(:category).permit(
      :name
    )
  end
end