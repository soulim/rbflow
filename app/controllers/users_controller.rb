class UsersController < ApplicationController
  load_and_authorize_resource
  
  respond_to :html
  
  def index
    respond_with(@users = User.all)
  end
    
  def show
    respond_with(@user = current_user)
  end
  
  def approve
    respond_with(@user.approve!, :location => users_url)
  end
  
  def unapprove
    respond_with(@user.unapprove!, :location => users_url)
  end
  
  def destroy
    respond_with(@user.destroy)
  end
end
