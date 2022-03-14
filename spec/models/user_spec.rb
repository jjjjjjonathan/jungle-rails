require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should save a new user' do
      user = User.new(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to be_valid
    end

    it 'should not be valid when given_name is missing' do
      user = User.new(
        given_name: nil,
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid when surname is missing' do
      user = User.new(
        given_name: "Jonathan",
        surname: nil,
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid when email is missing' do
      user = User.new(
        given_name: "Jonathan",
        surname: "Cheng",
        email: nil,
        password: "password",
        password_confirmation: "password"
      )
      expect(user).to_not be_valid
    end
  end
end
