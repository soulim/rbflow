require 'spec_helper'

describe SearchesController do
  let(:user) { mock_model(User, :admin? => false, :guest? => false) }
  let(:item) { mock_model(Item).as_null_object }
  
  before do
    controller.stub(:current_user).and_return(user)
    Item.stub(:search).and_return([item])
  end

  describe "GET index" do
    it "searches some items" do
      Item.should_receive(:search)
      get :index
    end
    
    it "assigns @items" do
      get :index
      assigns[:items].should eq([item])
    end
  end

end
