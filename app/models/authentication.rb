class Authentication < ActiveRecord::Base
  PROVIDERS = {
    "open_id" => "OpenID",
    "github"  => "GitHub",
    "twitter" => "Twitter"
  }

  belongs_to :user

  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider

  def self.create_with_omniauth!(auth, user = nil)
    user ||= User.create_with_omniauth!(auth)
    self.create! do |authentication|
      authentication.user = user
      authentication.uid = auth['uid']
      authentication.provider = auth['provider']
    end
  end

  def provider_name
    PROVIDERS[self.provider]
  end
end
