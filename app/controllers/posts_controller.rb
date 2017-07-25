class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # POST /posts
  # POST /posts.json
  def create
    byebug
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html{ return redirect_to '/'  }
        # format.js {   }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render 'home/index' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post_id = @post.id
    @post.destroy
    respond_to do |format|
      format.js{  }
      # format.js { post_id: post_id  }
      # format.html { redirect_to '/', notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :content, :image)
    end
end
