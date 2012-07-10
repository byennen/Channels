class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
      can :manage, :admin_pages
    elsif user.channel_master?
      can :manage, Channel, :id => user.channel_id
      can :manage, PhotoAlbum, :channel => {:id => user.channel_id}
      can :manage, Photo, :photo_album => {:id => user.channel_id}
      can :manage, Video, :channel => {:id => user.channel_id}
      can :manage, Album, :channel => {:id => user.channel_id}
      can :manage, Song,  :album    => {:channel_id => user.channel_id}
      can :manage, Post, :channel  => {:id => user.channel_id}
    end
  end
end
