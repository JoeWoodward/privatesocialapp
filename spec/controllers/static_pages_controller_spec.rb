require 'spec_helper'

describe StaticPagesController do
  describe "GET 'Home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
  end
end

describe 'routes for Home page' do
  it 'routes to "/"' do
    { :get => '/' }.should be_routable
  end
end
