class CommentsController < ApplicationController
  load_and_authorize_resource :item
  load_and_authorize_resource :comment, :through => :item
  
  respond_to :js
  
  def create
    @comment.user = current_user
    respond_with(@item, @comment.save)
  end
end
