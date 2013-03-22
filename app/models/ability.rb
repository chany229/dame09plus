# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
      can :write, Comment
    end
  end
end
