class SearchesController < ApplicationController
  respond_to :html
  
  def index
    respond_with @items = Item.search(params[:q], :page => params[:page], :per_page => Item.per_page)
  end

end
