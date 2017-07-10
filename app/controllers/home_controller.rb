class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
    @post = Post.new
    @feed = Post.all
  end
end
