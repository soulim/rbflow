require 'spec_helper'

describe UsersController do
  let(:user) { mock_model(User, :admin? => true, :guest? => false) }
  
  before { controller.stub(:current_user).and_return(user) }
  
  describe "GET index" do
    it "assigns @users" do
      User.stub_chain(:order, :page, :per).and_return([user])
      get :index
      assigns[:users].should eq([user])
    end
    
    context "when user is not an admin" do
      before { user.stub(:admin?).and_return(false) }
      
      it "sets flash notice" do
        get :index
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        get :index
        response.should redirect_to(sign_in_url)
      end
    end

    context "when user is a guest" do
      before { controller.stub(:current_user).and_return(nil) }
      
      it "sets flash notice" do
        get :index
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        get :index
        response.should redirect_to(sign_in_url)
      end
    end
  end
  
  describe "GET show" do
    it "assigns @user" do
      User.stub(:find).and_return(user)
      
      get :show, :id => user.id
      assigns[:user].should eq(user)
    end
    
    it "assigns only current user to @user" do
      another_user = mock_model(User)
      User.stub(:find).and_return(another_user)
      
      get :show, :id => another_user.id
      assigns[:user].should eq(user)
    end
  end

  describe "PUT approve" do
    let(:another_user) { mock_model(User) }
    
    before do
      another_user.stub(:approve!).and_return(another_user)
      User.stub(:find).and_return(another_user)
    end
    
    it "assigns @user" do
      put :approve, :id => another_user.id
      assigns[:user].should eq(another_user)
    end
    
    it "approves user" do
      another_user.should_receive(:approve!)
      put :approve, :id => another_user.id
    end
    
    it "redirects to users URL" do
      put :approve, :id => another_user.id
      response.should redirect_to(users_url)
    end
    
    context "when user is not an admin" do
      before { user.stub(:admin?).and_return(false) }
      
      it "sets flash notice" do
        put :approve, :id => another_user.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        put :approve, :id => another_user.id
        response.should redirect_to(sign_in_url)
      end
    end    
  end

  describe "PUT unapprove" do
    let(:another_user) { mock_model(User) }
    
    before do
      another_user.stub(:unapprove!).and_return(another_user)
      User.stub(:find).and_return(another_user)
    end
    
    it "assigns @user" do
      put :unapprove, :id => another_user.id
      assigns[:user].should eq(another_user)
    end
    
    it "unapproves user" do
      another_user.should_receive(:unapprove!)
      put :unapprove, :id => another_user.id
    end
    
    it "redirects to users URL" do
      put :unapprove, :id => another_user.id
      response.should redirect_to(users_url)
    end
    
    context "when user is not an admin" do
      before { user.stub(:admin?).and_return(false) }
      
      it "sets flash notice" do
        put :unapprove, :id => another_user.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        put :unapprove, :id => another_user.id
        response.should redirect_to(sign_in_url)
      end
    end    
  end
  
  describe "DELETE destroy" do
    let(:another_user) { mock_model(User) }
    
    before do
      another_user.stub(:destroy).and_return(another_user)
      User.stub(:find).and_return(another_user)
    end
    
    it "assigns @user" do
      delete :destroy, :id => another_user.id
      assigns[:user].should eq(another_user)
    end
    
    it "destroy user" do
      another_user.should_receive(:destroy)
      delete :destroy, :id => another_user.id
    end
        
    context "when user is not an admin" do
      before { user.stub(:admin?).and_return(false) }
      
      it "sets flash notice" do
        delete :destroy, :id => another_user.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        delete :destroy, :id => another_user.id
        response.should redirect_to(sign_in_url)
      end
    end    
  end
end
