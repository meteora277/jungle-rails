require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do 
    it "Should Validate if a password was provided" do 
      @user = User.new
      @user.password = "potatooo"
      @user.password_confirmation ="potatoo0"
      @user.save
      puts @user.errors.full_messages
    end
  end
end
