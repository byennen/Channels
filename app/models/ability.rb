class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
      can :manage, :admin_pages 
    elsif user.channel_master?
      can :manage, Channel, :id => user.channel_id
      can :manage, Photo, :channel => {:id => user.channel_id}
      can :manage, Video, :channel => {:id => user.channel_id}
      can :manage, Album, :channel => {:id => user.channel_id}
      can :manage, Song, :channel => {:id => user.channel_id}
      can :manage, Vault, :channel => {:id => user.channel_id}
      can :manage, Event, :channel => {:id => user.channel_id}
      can :manage, Post, :channel => {:id => user.channel_id}
      can :manage, Life, :channel => {:id => user.channel_id}
      can :manage, Give, :channel => {:id => user.channel_id}
      
    end
  end
end
