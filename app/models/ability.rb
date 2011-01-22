class Ability  
  include CanCan::Ability  
  
  def initialize(user)
    user ||= User.new     # guest user

    if user.admin?
      can :manage, :all
    else
      can :read, Item

      if !user.guest?
        can(:update, Item) { |item| item.author?(user) && item.created_at.today? }
        can(:destroy, Item) { |item| item.author?(user) && item.created_at.today? }
        can(:create, [Item, Comment])
        can(:show, User) { |_user| _user.me?(user) }
        can(:destroy, Authentication) { |authentication| authentication.user_id == user.id && user.authentications.size > 1 }
      end
    end
  end  
end