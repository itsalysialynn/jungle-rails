require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it('should be invalid if password_confirmation is not present') do
      user = User.new(password: 'password', password_confirmation: nil)
      expect(user).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if password is not present') do
      user = User.new(password: nil, password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if passwords do not match') do
      user = User.new(password: 'wrongpassword', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be valid if passwords match') do
      user = User.new(password: 'password', password_confirmation: 'password')
      expect(user).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if email already exists in database') do
      user1 = User.create!(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'my2@email.com')
      user2 = User.new(first_name: 'bob', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'my@email.com')
      expect(user2).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be valid if email does not exists in database') do
      user1 = User.new(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'my@email.com')
      user1.save
      user2 = User.new(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'bob@email.com')
      expect(user2).to be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if first_name is not preset') do
      user2 = User.new(last_name: 'last', password: 'password', password_confirmation: 'password', email: 'my@email.com')
      expect(user2).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if last_name is not preset') do
      user2 = User.new(first_name: 'first', password: 'password', password_confirmation: 'password', email: 'my@email.com')
      expect(user2).to_not be_valid
    end
  end

  describe 'Validations' do
    it('should be invalid if email is not preset') do
      user2 = User.new(first_name: 'first', password: 'password', password_confirmation: 'password')
      expect(user2).to_not be_valid
    end
  end

   describe 'Validations' do
    it('should be invalid if password is less than 8 characters') do
      user2 = User.new(first_name: 'first', password: 'pass', password_confirmation: 'pass')
      expect(user2).to_not be_valid
    end
  end

  
  describe '.authenticate_with_credentials' do
    it 'should return the correct user if email and password match' do
      actual_user = User.create(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'tom@email.com')
      new_user = User.authenticate_with_credentials('tom@email.com', 'password')
      expect(new_user).to eq(actual_user)
    end

     it 'should return the invalid if email does not match' do
      actual_user = User.create(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'tom@email.com')
      new_user = User.authenticate_with_credentials('tom2@email.com', 'password')
      expect(new_user).to_not eq(actual_user)
    end

     it 'should return the invalid if password does not match' do
      actual_user = User.create(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'tom@email.com')
      new_user = User.authenticate_with_credentials('tom@email.com', 'password1')
      expect(new_user).to_not eq(actual_user)
    end

    it 'should return the correct user if email has a space before it' do
      actual_user = User.create(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'tom@email.com')
      new_user = User.authenticate_with_credentials(' tom@email.com', 'password')
      expect(new_user).to eq(actual_user)
    end
  

  it 'should return the correct if email matches without being case sensitive' do
      actual_user = User.create(first_name: 'name', last_name: 'last', password: 'password', password_confirmation: 'password', email: 'tom@email.com')
      new_user = User.authenticate_with_credentials('Tom@email.com', 'password')
      expect(new_user).to eq(actual_user)
  end
  end
end
