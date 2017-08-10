class HomeController < ApplicationController

  before_action :authenticate_user!
  def index
    respond_to do |format|
      format.html{
        @feed = current_user.feed.take(10)
        @post = Post.new
        @comment = Comment.new
      }
      format.js{
        offset = params["offset"]
        if offset
          offset = offset.to_i
        else
          offset = 0
        end

        @new_offset = offset + 10
        @feed = current_user.feed.drop(offset).take(10)
        @comment = Comment.new
      }
    end

  end

  def users
    @users = User.all
  end

  def requests
    @requests = current_user.requests
  end

  def friends
    @friends = current_user.friends
  end

  def profile
  end

  def upload_image
  	uploaded_file = params[:image]
  	filename = SecureRandom.hex + "." +uploaded_file.original_filename.split('.')[1]
  	filepath = Dir.pwd + "/public/uploads/" + filename
	  File.open(filepath,'wb') do |file|
		    file.write(uploaded_file.read())
	  end

	    current_user.profile_picture = filename
	    current_user.save!
  	  return redirect_to '/profile'
  end

end
