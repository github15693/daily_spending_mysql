class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.roles.where(name:'Admin').size > 0
       can :manage, :all
    elsif user && user.persisted?
       can :read, :all
    end
    can :manage , :session
    can :manage , :registration
  end
end
