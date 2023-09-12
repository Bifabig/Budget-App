class Ability
  include CanCan::Ability

  # def initialize(user)
  #   can :read, Entity, public: true
  #   can :read, Group, public: true

  #   return unless user.present?

  #   can :manage, Entity, user:
  # end
end
