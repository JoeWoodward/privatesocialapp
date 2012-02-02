require 'spec_helper'

describe Admin do
  context 'on create' do
    it 'should verify presence of a first name' do
      FactoryGirl.build(:admin, :first_name => '').should_not be_valid
    end
    it 'should verify presence of a last name' do
      FactoryGirl.build(:admin, :last_name => '').should_not be_valid
    end
    it 'should verify presence of an email' do
      FactoryGirl.build(:admin, :email => '').should_not be_valid
    end
    it 'should verify presence of a password' do
      FactoryGirl.build(:admin, :password => '').should_not be_valid
    end
    it 'should create a valid admin' do
      FactoryGirl.build(:admin).should be_valid
    end
    it 'should validate the uniqueness of the email' do
      FactoryGirl.create(:admin)
      FactoryGirl.build(:admin, :first_name => 'joe', :last_name => 'woodward').should_not be_valid
    end
    it 'should confirm the password' do
      FactoryGirl.build(:admin, :password_confirmation => 'differentpassword').should_not be_valid
    end
    it 'should titleize the first name' do
      admin = FactoryGirl.create(:admin, :first_name => 'oops')
      admin.first_name.should == 'Oops'
    end
    it 'should titleize the last name' do
      admin = FactoryGirl.create(:admin, :last_name => 'my mistake')
      admin.last_name.should == 'My Mistake'
    end
    it 'should downcase the email address' do
      admin = FactoryGirl.create(:admin, :email => 'UPPERCASE.EMAIL@NO.PROBLEM')
      admin.email.should == 'uppercase.email@no.problem'
    end
    it 'should create the admins full name' do
      admin = FactoryGirl.create(:admin, :first_name => 'First', :last_name => 'Last')
      admin.full_name.should == 'First Last'
    end
  end
end
