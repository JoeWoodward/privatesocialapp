require 'spec_helper'

describe Event do
  context 'on create' do
    it 'should verify presence of a title' do
      FactoryGirl.build(:event, :title => '').should_not be_valid
    end
    it 'should verify presence of a description' do
      FactoryGirl.build(:event, :description => '').should_not be_valid
    end
    it 'should verify presence of a date' do
      FactoryGirl.build(:event, :date => '').should_not be_valid
    end
    it 'should validate the presence of an image' do
      FactoryGirl.build(:event, :image => '').should_not be_valid
    end
    it 'should create a valid event' do
      FactoryGirl.build(:event).should be_valid
    end
    it 'should validate the uniqueness of the description' do
      FactoryGirl.create(:event)
      FactoryGirl.build(:event).should_not be_valid
    end
    it 'should titleize the title' do
      event = FactoryGirl.create(:event, :title => 'oops')
      event.title.should == 'Oops'
    end
    it 'should validate the date is in the future' do
      event = FactoryGirl.build(:event, :date => Date.today).should_not be_valid
    end
  end
end

