class ItemsController < ApplicationController
  load_and_authorize_resource

  respond_to :html
  respond_to :rss, :only => :index
  
  def index
    respond_with(@items = Item.recent.paginate(:page => params[:page]))
  end
  
  def new
    respond_with(@item = current_user.items.new)
  end
  
  def create
    respond_with(@item = current_user.items.create(params[:item]))
  end
  
  def show
    respond_with(@item)
  end
  
  def edit
    respond_with(@item)
  end
  
  def update
    @item.update_attributes(params[:item])
    respond_with(@item)
  end
  
  def destroy
    @item.destroy
    respond_with(@item)
  end
end
