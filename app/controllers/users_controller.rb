class UsersController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, :only => [ :index, :approve, :unapprove, :destroy ]
  before_filter :assign_user, :only => [ :approve, :unapprove, :destroy ]
  
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
  
  private
  
  def assign_user
    @user = User.find_by_id(params[:id])
  end
end
