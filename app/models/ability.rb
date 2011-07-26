class Ability
  include CanCan::Ability

  def initialize(user)
    if Usuario.all.blank?
      can [:sing_up, :create], Usuario
    else
      if user.blank? == false
        if user.role.nome == 'admin'
          can :manage, :all
        else
          can :read, :all
          can [:log_out, :read], Usuario
        end
      else
        can :log_in, Usuario
      end
    end
  end

end