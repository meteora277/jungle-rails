require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validation" do 
    it "should throw an error if password is not provided" do 
      @user = User.new
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "should throw an error if first name is not provided" do 
      @user = User.new
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "should throw an error if last name is not provided" do 
      @user = User.new
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "should throw an error if password and password_confirmation do not match" do
      @user = User.new
      @user.password = "potatooo"
      @user.password_confirmation = "pootatoooo"
      @user.save

      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "should throw an error if user email is already in db (not case sensitive)" do 
      @user1 = User.new
      @user1.email = "test@test.com    "
      @user1.first_name = "bob"
      @user1.last_name = "potato"
      @user1.password = "potatoooo"
      @user1.password_confirmation = "potatoooo"
      @user1.parse_email
      @user1.save

      @user2 = User.new
      @user2.email = "TEST@TEST.com"
      @user2.first_name = "bob"
      @user2.last_name = "potato"
      @user2.password = "potatoooo"
      @user2.password_confirmation = "potatoooo"
      @user2.save

      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    it "should login a user even if email has trailing spaces" do 
      @user1 = User.new
      @user1.email = "    test@test.com    "
      @user1.first_name = "bob"
      @user1.last_name = "potato"
      @user1.password = "potatoooo"
      @user1.password_confirmation = "potatoooo"
      @user1.parse_email
      @user1.save

      expect(User.authenticate_with_credentials(@user1.email, @user1.password).email).to eql("test@test.com")
      
    end
    it "should throw an error if password length < 8" do
      @user = User.new
      @user.password = "sixUwu"
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end

  end
  describe "authenticate_with_credentials" do
    it "should return true if user and password match" do
      @user = User.create(
        email: "test@test.com",
        first_name: "bob",
        last_name: "potato",
        password: "potatooo",
        password_confirmation: "potatooo"
      )
      expect(User.authenticate_with_credentials(@user.email, @user.password)).to eql(@user)
    end
  end
end
