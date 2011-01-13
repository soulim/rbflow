require 'spec_helper'

describe CommentsController do
  let(:user) { mock_model(User, :admin? => false, :guest? => false) }
  let(:item) { mock_model(Item).as_null_object }
  let(:comment) { mock_model(Comment).as_null_object }
  
  before do
    controller.stub(:current_user).and_return(user)
    Item.stub(:find).and_return(item)
  end

  describe "XHR POST create" do
    before do
      item.stub_chain(:comments, :new).and_return(comment)
    end
  
    it "assigns @item" do
      xhr :post, :create, :item_id => item.id
      assigns[:item].should_not be_nil
    end
    
    it "creates a new comment" do
      item.comments.should_receive(:new)
      xhr :post, :create, :item_id => item.id
    end
    
    it "assigns @comment" do
      xhr :post, :create, :item_id => item.id
      assigns[:comment].should_not be_nil      
    end

    it "saves the new comment" do
      comment.should_receive(:save)
      xhr :post, :create, :item_id => item.id
    end
    
    context "when user is a guest" do
      before { controller.stub(:current_user).and_return(nil) }
      
      it "sets flash notice" do
        xhr :post, :create, :item_id => item.id
        flash[:notice].should_not be_blank
      end
      
      it "redirects to sign in URL" do
        xhr :post, :create, :item_id => item.id
        response.should redirect_to(sign_in_url)
      end
    end
  end
end
