class ItemsController < ApplicationController
  load_and_authorize_resource

  respond_to :html
  respond_to :rss, :only => :index
  
  def index
    respond_with(@items = Item.recent.page(params[:page]).per(10))
  end
  
  def new
    respond_with(@item = current_user.items.new)
  end
  
  def create
    @item = current_user.items.create(params[:item]) and flash[:notice] = t("items.create.successful")
    respond_with(@item)
  end
  
  def show
    respond_with(@item)
  end
  
  def edit
    respond_with(@item)
  end
  
  def update
    @item.update_attributes(params[:item]) and flash[:notice] = t("items.update.successful")
    respond_with(@item)
  end
  
  def destroy
    @item.destroy and flash[:notice] = t("items.destroy.successful")
    respond_with(@item)
  end
end
