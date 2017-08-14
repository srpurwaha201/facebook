class CommentsApiController < ActionController::API

  def create
    comment = Comment.new
    comment.content = params["content"]
    comment.user_id = params["user_id"]
    comment.post_id = params["post_id"]
    comment.created_at = Time.now
    comment.updated_at = Time.now
    data = {}
    if comment.save
      data["message"] = "comment created"
      data["comment"] = comment
    else
      data["message"] = "comment not created"
    end

    render json: data
  end
end
