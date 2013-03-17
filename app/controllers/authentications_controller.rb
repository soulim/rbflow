class AuthenticationsController < ApplicationController
  load_and_authorize_resource :only => :destroy

  respond_to :html

  def new; end

  def create
    auth = request.env['omniauth.auth']

    unless @auth = Authentication.find_by_provider_and_uid(auth["provider"], auth["uid"])
      @auth = Authentication.create_with_omniauth!(auth, current_user)
    end
    self.current_user = @auth.user

    respond_with(@auth) do |format|
      format.html { redirect_back_or_default root_url }
    end
  end

  def destroy
    @authentication.destroy and flash[:notice] = t("authentications.destroy.successful")
    respond_with(@authentication, :location => user_url(current_user))
  end
end
