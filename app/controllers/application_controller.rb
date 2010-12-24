class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :signed_in?
  
  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!current_user
  end

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.id
  end
  
  def require_user
    if !signed_in?
      store_location
      redirect_to sign_in_path, :notice => t("layouts.must_be_signed_in")
    end
  end

  def require_admin
    if !signed_in? || !current_user.admin?
      redirect_to sign_in_path, :notice => t("layouts.must_be_admin")
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to back_or_default_path(default)
    session[:return_to] = nil
  end
  
  def back_or_default_path(default)
    session[:return_to] || default
  end
end
