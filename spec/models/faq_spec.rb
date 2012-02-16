require 'spec_helper'

describe Faq do
  context 'on create' do
    it 'should verify presence of a question' do
      FactoryGirl.build(:faq, :question => '').should_not be_valid
    end
    it 'should verify presence of a answer' do
      FactoryGirl.build(:faq, :answer => '').should_not be_valid
    end
    it 'should validate the uniqueness of the question' do
      FactoryGirl.create(:faq)
      FactoryGirl.build(:faq).should_not be_valid
    end
  end
end
