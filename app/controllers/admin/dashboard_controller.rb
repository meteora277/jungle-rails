class Admin::DashboardController < ApplicationController
  require 'dotenv/load'
  http_basic_authenticate_with :name => ENV["USER_NAME"], :password => ENV["PASSWORD"]
  def show
    @item_count = Product.count(:id)
    @number_of_categories = Category.count(:id)
  end
end
