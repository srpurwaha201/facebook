class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :authorize_user]
  before_action :authorize_user, only: [:update, :destroy]
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    respond_to do |format|
      format.js{
      }
    end
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        # format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        # format.json { render :show, status: :ok, location: @post }
        format.js{}
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.post_id = params["comment"]["post_id"]
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js {  }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json


  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment_id = @comment.id
    @comment.destroy
    respond_to do |format|
      format.js{  }
      # format.html { redirect_to '/', notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end

    def authorize_user
      if current_user!= @comment.user
        return redirect_to '/'
      end
    end
end
