require 'spec_helper'

describe ItemsController do
  let(:user) { mock_model(User, :admin? => false, :guest? => false) }
  let(:item) { mock_model(Item).as_null_object }
  
  before { controller.stub(:current_user).and_return(user) }
  
  describe "GET index" do
    it "assigns @items" do
      Item.stub_chain(:recent, :limit).and_return([item])
      get :index
      assigns[:items].should eq([item])
    end
  end
  
  describe "GET new" do
    before { user.stub_chain(:items, :new).and_return(item) }
    
    it "creates a new item" do
      user.items.should_receive(:new)
      get :new
    end
    
    it "assigns @item" do
      get :new
      assigns[:item].should eq(item)
    end
    
    context "when user is a guest" do
      before { controller.stub(:current_user).and_return(nil) }
      
      it "sets flash notice" do
        get :new
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        get :new
        response.should redirect_to(sign_in_url)
      end
    end
  end
  
  describe "POST create" do
    before { user.stub_chain(:items, :create).and_return(item) }
    
    it "creates a new item" do
      user.items.should_receive(:create)
      post :create
    end
    
    it "redirects to item URL" do
      post :create
      response.should redirect_to(item_url(item))
    end
    
    context "when user is a guest" do
      before { controller.stub(:current_user).and_return(nil) }
      
      it "sets flash notice" do
        get :new
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        get :new
        response.should redirect_to(sign_in_url)
      end
    end
  end
  
  describe "GET show" do
    before { Item.stub(:find).and_return(item) }
    
    it "assigns @item" do
      get :show, :id => item.id
      assigns[:item].should eq(item)
    end    
  end

  describe "GET edit" do
    before { Item.stub(:find).and_return(item) }
    
    it "assigns @item" do
      get :edit, :id => item.id
      assigns[:item].should eq(item)
    end
    
    context "when user is a guest" do
      before { controller.stub(:current_user).and_return(nil) }
      
      it "sets flash notice" do
        get :edit, :id => item.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        get :edit, :id => item.id
        response.should redirect_to(sign_in_url)
      end
    end

    context "when user is not an author" do
      before do
        item.stub(:author?).and_return(false)
      end
      
      it "sets flash notice" do
        get :edit, :id => item.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        get :edit, :id => item.id
        response.should redirect_to(sign_in_url)
      end
    end
  end
  
  describe "GET show" do
    before { Item.stub(:find).and_return(item) }
    
    it "assigns @item" do
      get :show, :id => item.id
      assigns[:item].should eq(item)
    end    
  end

  describe "PUT update" do
    let(:attributes) { { "title" => "Foo" } }
    before { Item.stub(:find).and_return(item) }
    
    it "assigns @item" do
      put :update, :id => item.id
      assigns[:item].should eq(item)
    end
    
    it "updates item" do
      item.should_receive(:update_attributes).with(attributes)
      put :update, :id => item.id, :item => attributes
    end
    
    it "redirects to item url" do
      put :update, :id => item.id
      response.should redirect_to(item_url(item))
    end
    
    context "when user is a guest" do
      before { controller.stub(:current_user).and_return(nil) }
      
      it "sets flash notice" do
        put :update, :id => item.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        put :update, :id => item.id
        response.should redirect_to(sign_in_url)
      end
    end

    context "when user is not an author" do
      before do
        item.stub(:author?).and_return(false)
      end
      
      it "sets flash notice" do
        put :update, :id => item.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        put :update, :id => item.id
        response.should redirect_to(sign_in_url)
      end
    end
  end
  
  describe "DELETE destroy" do
    before { Item.stub(:find).and_return(item) }
    
    context "when user is an admin" do
      before { user.stub(:admin?).and_return(true) }
      
      it "assigns @item" do
        delete :destroy, :id => item.id
        assigns[:item].should eq(item)
      end

      it "destroy item" do
        item.should_receive(:destroy)
        delete :destroy, :id => item.id
      end

      it "redirects to items url" do
        delete :destroy, :id => item.id
        response.should redirect_to(items_url)
      end
    end
    
    context "when user is a guest" do
      before { controller.stub(:current_user).and_return(nil) }
      
      it "sets flash notice" do
        delete :destroy, :id => item.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        delete :destroy, :id => item.id
        response.should redirect_to(sign_in_url)
      end
    end

    context "when user is not an admin" do
      it "sets flash notice" do
        delete :destroy, :id => item.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        delete :destroy, :id => item.id
        response.should redirect_to(sign_in_url)
      end
    end    
  end
end
