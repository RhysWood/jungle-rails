require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be created with the required fields' do
      @user = User.new({
        name: 'John',
        email: "email@email.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(@user).to be_valid
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
