class LikesController < ApplicationController
  def toggle_like
    like_type = params["like_type"]
    like_id = params["like_id"]
    like = Like.where(like_id: like_id, like_type: like_type, user_id: current_user.id)
    if like.count > 0
      like[0].destroy
    else
      like = Like.create(like_id: like_id, like_type: like_type, user_id: current_user.id)
    end
    return redirect_to "/"
  end
end
