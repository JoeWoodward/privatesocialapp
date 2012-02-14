require 'spec_helper'

describe Offer do
  context 'on create' do
    it 'should verify presence of a name' do
      FactoryGirl.build(:offer, :name => '').should_not be_valid
    end
    it 'should verify presence of a image' do
      FactoryGirl.build(:offer, :image => '').should_not be_valid
    end
    it 'should validate the uniqueness of the name' do
      FactoryGirl.create(:offer)
      FactoryGirl.build(:offer).should_not be_valid
    end
  end
end
