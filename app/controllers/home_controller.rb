class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
    @post = Post.new
    @feed = Post.all
  end

  def users
    @users = User.all
  end

  def requests
    @requests = FriendRequest.where(reciever_id: current_user.id)
  end
end
