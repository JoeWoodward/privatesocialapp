require 'spec_helper'

describe Notice do
  context 'on create' do
    it 'should verify presence of a title' do
      FactoryGirl.build(:notice, :title => '').should_not be_valid
    end
    it 'should verify presence of a description' do
      FactoryGirl.build(:notice, :description => '').should_not be_valid
    end
    it 'should create a valid notice' do
      FactoryGirl.build(:notice).should be_valid
    end
    it 'should validate the uniqueness of the details' do
      FactoryGirl.create(:notice)
      FactoryGirl.build(:notice, :title => 'joe', :contact_email => 'woodward', :contact_phone => '092134').should_not be_valid
    end
    it 'should titleize the title' do
      notice = FactoryGirl.create(:notice, :title => 'oops')
      notice.title.should == 'Oops'
    end
    it 'should downcase the email address' do
      notice = FactoryGirl.create(:notice, :contact_email => 'UPPERCASE.EMAIL@NO.PROBLEM')
      notice.contact_email.should == 'uppercase.email@no.problem'
    end
    it 'should verify the phone number is a number' do
      FactoryGirl.build(:notice, :contact_phone => 'jsdfls').should_not be_valid
    end
  end
end
