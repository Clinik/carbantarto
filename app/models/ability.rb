class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest
    if user.has_role? :admin
        can :manage, :all
    else
      if user.has_role? :usr
        can :read, :all
        can :create, Vehicle
        can :create, Property
        can :update, Vehicle, :user_id => user.id
        cannot :update, Property
        can :destroy, Vehicle, :user_id => user.id
        cannot :destroy, Property
        
      end
    end
  end
end
