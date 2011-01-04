class AuthenticationsController < ApplicationController
  respond_to :html
  
  def new; end
  
  def create
    auth = request.env['omniauth.auth']

    unless @auth = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"])
      # Create a new user or add an auth to existing user, depending on
      # whether there is already a user signed in.
      @auth = Authentication.create_with_omniauth(auth, current_user)
    end
    # Log the authorizing user in.
    self.current_user = @auth.user

    respond_with(@auth) do |format|
      format.html { redirect_back_or_default root_url }
    end
  end
end
