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
      FactoryGirl.build(:user).should be_valid
    end
    it 'should validate the uniqueness of the email' do
      FactoryGirl.create(:user)
      FactoryGirl.build(:user, :first_name => 'joe', :last_name => 'woodward').should_not be_valid
    end
    it 'should confirm the password' do
      FactoryGirl.build(:user, :password_confirmation => 'differentpassword').should_not be_valid
    end
    it 'should titleize the first name' do
      user = FactoryGirl.create(:user, :first_name => 'oops')
      user.first_name.should == 'Oops'
    end
    it 'should titleize the last name' do
      user = FactoryGirl.create(:user, :last_name => 'my mistake')
      user.last_name.should == 'My Mistake'
    end
    it 'should downcase the email address' do
      user = FactoryGirl.create(:user, :email => 'UPPERCASE.EMAIL@NO.PROBLEM')
      user.email.should == 'uppercase.email@no.problem'
    end
    it 'should create the users full name' do
      user = FactoryGirl.create(:user, :first_name => 'First', :last_name => 'Last')
      user.full_name.should == 'First Last'
    end
  end
end
