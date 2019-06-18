require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.new(
        first_name: 'John',
        last_name: 'Oh',
        email: 'test2@test.com',
        password: '1233',
        password_confirmation: '1233',
      )
  end 

  describe "Validations" do
    it "is valid with all required fields" do
      expect(@user).to be_valid
    end


    it "should have a password" do
    @user = User.new({
        password: nil,
        password_confirmation: nil
      })
      expect(@user).to_not be_valid
  end

  it "Password and password_confirmation should match" do
    @user = User.new(
      password: '1233',
      password_confirmation: '1243',
    )
    expect(@user.password).to_not be_equal(@user.password_confirmation)
  end

  it "Password cannot be less then 3 characters" do
   @user = User.new(
      password: '13',
      password_confirmation: '13',
    )
    expect(@user.password.length).to_not be_equal(3)
    end
 end   

    describe '.authenticate_with_credentials' do
      it 'Should log the user in if password and email are correct' do
        @user = User.new(
        email: 'test@test.com',
        password: '12334',
        password_confirmation: '12334')
        valid_user = User.authenticate_with_credentials('test@test.com', '12334')
        expect(valid_user).to be_valid 
        end      

       it "Should not login with the incorrect password" do
        @user = User.new(
          email: 'test@test.com',
        password: '1233',
        password_confirmation: '1233')
        non_valid = User.authenticate_with_credentials('test@test.com', '1234')
        expect(non_valid).to eq(nil)
       end

       it "Should user should login with spaces around email" do
        @user = User.new(email: 'test@test.com', password: '1233', password_confirmation: '1233')
        spaced = User.authenticate_with_credentials('  test@test.com  ', '1233')
        expect(spaced).to be_valid
       end
       
       it "should have case insensitive email" do
        @user = User.new(email: 'test@test.com', password: '1233', password_confirmation: '1233')
        caps = User.authenticate_with_credentials('tEst@tEst.CoM', '1233')
        expect(caps).to be_valid
       end
  end
end

