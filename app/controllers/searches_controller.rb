class SearchesController < ApplicationController
  respond_to :html

  def index
    @search = Search.new(Item)
    respond_with @items = @search.perform(params[:q]).page(params[:page]).per(20)
  end

end
