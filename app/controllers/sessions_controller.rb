class SessionsController < ApplicationController
  def new
    
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => t("sessions.destroy.successful")
  end
end
