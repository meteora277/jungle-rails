class Admin::DashboardController < ApplicationController
  require 'dotenv/load'
  http_basic_authenticate_with :name => ENV["USER_NAME"], :password => ENV["PASSWORD"]
  def show
    
  end
end
