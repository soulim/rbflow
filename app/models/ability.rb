class Ability  
  include CanCan::Ability  
  
  def initialize(user)
    user ||= User.new     # guest user

    if user.admin?
      can :manage, :all
    else
      can :read, Item

      if !user.guest?
        can :create, Item
        can(:update, Item) { |item| item.author?(user) }
        can(:show, User) { |_user| _user.me?(user) }
      end
    end
  end  
end