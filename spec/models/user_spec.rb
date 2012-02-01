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
    it 'should create a valid user' do
      user = FactoryGirl.build(:user)
      user.should be_valid
    end
    it 'should validate the uniqueness of the email' do
      FactoryGirl.create(:user)
      FactoryGirl.build(:user, :first_name => 'joe', :last_name => 'woodward').should_not be_valid
    end
    it 'should confirm the password' do
      FactoryGirl.build(:user, :password_confirmation => 'differentpassword').should_not be_valid
    end
  end
end
