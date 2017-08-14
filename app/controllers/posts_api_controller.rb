class PostsApiController < ActionController::API

  def create
    post = Post.new
    post.content = params["content"]
    post.user_id = params["user_id"]
    post.created_at = Time.now
    post.updated_at = Time.now
    post.id = Post.last.id + 1
    data = {}
    if post.save
      data["message"] = "created post"
      data["post"] = post
    else
      data["message"] = "post not created"
    end

    render json: data
  end

  def delete
    post_id = params["post_id"]
    post = Post.find(post_id)
    post.delete
    data = {}
    data["message"] = "post deleted"
    data["post"] = post

    render json: data
  end
end
