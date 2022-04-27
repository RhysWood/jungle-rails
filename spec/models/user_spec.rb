require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with the required fields' do
      @user = User.new({
        name: "John",
        email: "test@email.com",
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

    it 'should require name' do
      @user = User.new({
        name: nil,
        email: "user@example.com",
        password: "password1",
        password_confirmation: "password1"
      })
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include "Name can't be blank"
    end

    it 'should require email' do
      @user = User.new({
        name: 'John',
        email: nil,
        password: "password1",
        password_confirmation: "password1"
      })
      expect(@user).to be_invalid
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    describe "emails must be unique" do
      before(:all) do
        @setup = User.create({
          name: "user1",
          email: "user@example.com",
          password: "password1",
          password_confirmation: "password1"
        })
      end
      it 'should ensure emails are unique' do
        @user = User.new({
            name: "user1",
            email: "user@example.com",
            password: "password1",
            password_confirmation: "password1"
        })
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages).to include "Email has already been taken"
      end
    end
  end

  describe '.authenticate_with_credentials' do
    before(:all) do
      @control = User.create({
        name: "John",
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      })
    end 

    it 'should authenticate with the correct input' do
      email = "email@email.com"
      password = "password"
      @user = User.authenticate_with_credentials(email, password)

      expect(@user).not_to be_nil
    end

    it 'should authenticate with spaces before or after the email ' do
      email = "  email@email.com "
      password = "password"
      @user = User.authenticate_with_credentials(email, password)

      expect(@user).not_to be_nil
    end

    it 'should authenticate if the email case incorrect' do
      email = "EMAIL@EmaIL.com"
      password = "password"
      @user = User.authenticate_with_credentials(email, password)

      expect(@user).not_to be_nil
    end
  end

end
