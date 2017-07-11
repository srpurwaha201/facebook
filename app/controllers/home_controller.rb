class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
    @post = Post.new
    @feed = []
    Post.all.order("created_at DESC").each do |post|
      if (current_user.isFriend? post.user_id) || (post.user_id == current_user.id)
        @feed << post
      end
    end
  end

  def users
    @users = User.all
  end

  def requests
    @requests = FriendRequest.where(reciever_id: current_user.id)
  end

  def friends
    @friends = []
    friend_mappings = Friend.where(friend1_id: current_user.id) + Friend.where(friend2_id: current_user.id)
    friend_mappings.each do |friend_mapping|
      if friend_mapping.friend1_id == current_user.id
        @friends << User.find(friend_mapping.friend2_id)
      else
        @friends << User.find(friend_mapping.friend1_id)
      end
    end
  end

  def profile
  end
end
