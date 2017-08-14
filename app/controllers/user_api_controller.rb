class UserApiController < ActionController::API
  def feed
    user_id = params["user_id"]
    data = {}
    user = User.find(user_id)
    if user
      data[:feed] = user.feed
    else
      data[:message] = "user not found"
    end
    render json: data
  end
end
