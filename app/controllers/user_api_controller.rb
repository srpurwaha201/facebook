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

  def sign_up
    user = User.new
    user.email = params["email"]
    user.password = params["password"]
    user.first_name = params["first_name"]
    user.last_name = params["last_name"]
    user.created_at = Time.now
    user.updated_at = Time.now
    user.id = User.last.id + 1
    data = {}
    if user.save
      data["message"] = "user created"
      data["user"] = user
    else
      data["message"] = "user not created"
    end
    render json: data
  end

  def sign_in
    data = {}
    user = User.find_by_email(params[:email])
    if user
      if user.valid_password?(params[:password])
        user.access_token = SecureRandom.hex()
        data["message"] = "signed id"
        data["user"] = user
      else
        data["message"] = "invalid password"
      end
    else
      data["message"] = "invalid email"
    end

    render json: data

  end
end
