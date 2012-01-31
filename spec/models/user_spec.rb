require 'spec_helper'

describe User do
  context 'on create' do
    it 'should verify presence of a first name' do
      FactoryGirl.build(:user, :first_name => '').should_not be_valid
    end
    it 'should verify presence of a last name' do
      FactoryGirl.build(:user, :last_name => '').should_not be_valid
    end
    it 'should verify presence of an email' do
      FactoryGirl.build(:user, :email => '').should_not be_valid
    end
    it 'should verify presence of a password' do
      FactoryGirl.build(:user, :password => '').should_not be_valid
    end
    it 'should verify presence of a password confirmation' do
      FactoryGirl.build(:user, :password_confirmation => '').should_not be_valid
    end
    it 'should create a valid user' do
      FactoryGirl.build(:user).should be_valid
    end
  end
end
