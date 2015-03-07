class Ability
  include CanCan::Ability

  def initialize(user)
      user ||= User.new
      # can :read, User, id: user.id
      if user.admin?
        can :read, :all
      else
        can :read, User, id: user.id
      end
  end
end
