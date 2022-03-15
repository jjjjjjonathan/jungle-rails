require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should save a new user' do
      user = User.new(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "TEST@TEST.CA",
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

    it 'should not be valid if passwords are not matching' do
      user = User.new(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "different password"
      )
      expect(user).to_not be_valid
    end

    it 'should not be valid if email is already in database (not case sensitive)' do
      user1 = User.create(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )

      user2 = User.new(
        given_name: "Zaki",
        surname: "Khan",
        email: "TEST@TEST.ca",
        password: "password",
        password_confirmation: "password"
      )
      expect(user1).to be_valid
      expect(user2).to_not be_valid
    end

    it 'should not accept a password shorter than 5 characters' do
      user = User.new(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "pass",
        password_confirmation: "pass"
      )
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should authenticate a user with correct email and password' do
      user = User.create(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      user_to_authenticate = User.authenticate_with_credentials("test@test.ca", "password")
      expect(user_to_authenticate).to be == user
    end
    
    it 'should not authenticate a user with incorrect password' do
      user = User.create(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      user_to_authenticate = User.authenticate_with_credentials("test@test.ca", "password12345")
      expect(user_to_authenticate).to be == nil
    end

    it 'should not authenticate a user with incorrect email' do
      user = User.create(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      user_to_authenticate = User.authenticate_with_credentials("notest@test.ca", "password")
      expect(user_to_authenticate).to be == nil
    end

    it 'should remove whitespace from beginning and end of email and still authenticate if valid' do
      user = User.create(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      user_to_authenticate = User.authenticate_with_credentials("   test@test.ca       ", "password")
      expect(user_to_authenticate).to be == user
    end

    it 'should authenticate even if email is in different case' do
      user = User.create(
        given_name: "Jonathan",
        surname: "Cheng",
        email: "test@test.ca",
        password: "password",
        password_confirmation: "password"
      )
      user_to_authenticate = User.authenticate_with_credentials("   tEst@TeSt.cA       ", "password")
      expect(user_to_authenticate).to be == user
    end
  end

end
