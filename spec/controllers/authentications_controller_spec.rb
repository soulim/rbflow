require 'spec_helper'

describe AuthenticationsController do
  let(:auth) { mock_model(Authentication).as_null_object }
  let(:auth_hash) { { "provider" => "twitter", "uid" => "1234" } }
  
  before(:each) do
    request.env["omniauth.auth"] = auth_hash
  end
  
  context "when authentication already exists" do
    before do
      Authentication.stub(:find_by_provider_and_uid).and_return(auth)
    end
    
    it "authenticates user" do
      controller.should_receive(:current_user=)
      get :create, :provider => "twitter"
    end
    
    it "redirects to home page" do
      get :create, :provider => "twitter"
      response.should redirect_to(root_url)
    end
  end
  
  context "when authentication does not exist yet" do
    before do
      Authentication.stub(:find_by_provider_and_uid).and_return(nil)
      Authentication.stub(:create_with_omniauth).and_return(auth)
    end
    
    it "creates a new athentication" do
      Authentication.should_receive(:create_with_omniauth).with(auth_hash, nil)
      get :create, :provider => "twitter"
    end
    
    it "authenticates user" do
      controller.should_receive(:current_user=)
      get :create, :provider => "twitter"
    end
    
    it "redirects to home page" do
      get :create, :provider => "twitter"
      response.should redirect_to(root_url)
    end
  end
end
