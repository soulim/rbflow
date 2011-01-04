require 'spec_helper'

describe SessionsController do
  before { session[:user_id] = 1 }
  
  describe "DELETE destroy" do
    it "drops user's session" do
      delete :destroy
      session[:user_id].should be_nil
    end
    
    it "redirects to home url" do
      delete :destroy
      response.should redirect_to(root_url)
    end
  end
end
