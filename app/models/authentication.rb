class Authentication < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id, :uid, :provider
  validates_uniqueness_of :uid, :scope => :provider
  
  def self.create_with_omniauth(auth, user = nil)
    user ||= User.create_with_omniauth!(auth)
    self.create(:user => user, :uid => auth['uid'], :provider => auth['provider'])
  end
  
  def provider_name
    (self.provider == "open_id") ? "OpenID" : self.provider.titleize
  end
end
