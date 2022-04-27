require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with the required fields' do
      @user = User.new({
        name: "John",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user).to be_valid
    end

    it 'should match password and password_confirmation' do
      @user = User.new({
        name: "John",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password1"
      })
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

  end

  describe '.authenticate_with_credentials' do
    # exam
  end

end
