require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it "Should be able to create a new user" do
      @user = User.new(
        first_name: 'John',
        last_name: 'Oh',
        email: 'test@test.com',
        password: '1233',
        password_confirmation: '1233',
      )
      expect(@user).to be_valid
    end


    it "should have a password" do
    @user = User.new({
        first_name:'John',
        last_name:'Oh',
        email:'test@test.com',
        password: nil,
        password_confirmation: nil
      })
      expect(@user).to_not be_valid
  end

  it "Password and password_confirmation should match" do
    @user = User.new(
      first_name: 'John',
      last_name: 'Oh',
      email: 'test@test.com',
      password: '1233',
      password_confirmation: '1243',
    )
    expect(@user.password).to_not be_equal(@user.password_confirmation)
  end

  it "Password cannot be less then 3 characters" do
   @user = User.new(
      first_name: 'John',
      last_name: 'Oh',
      email: 'test@test.com',
      password: '13',
      password_confirmation: '13',
    )
    expect(@user).to_not be_valid
    end
end
end
