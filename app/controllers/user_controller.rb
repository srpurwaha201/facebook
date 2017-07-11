class UserController < ApplicationController
  def newRequest
    request = FriendRequest.new
    request.sender_id = current_user.id
    request.reciever_id = params[:reciever_id]
    request.save
    return redirect_to '/users'
  end

  def acceptRequest
    if(!current_user.isFriend?(params[:friend2_id]))
    # if(!isFriend(params[:friend2_id]))
        @newFriends = Friend.new
        @newFriends.friend1_id = current_user.id
        @newFriends.friend2_id = params[:friend2_id]
        @newFriends.save
        deleteRequest params[:friend2_id]
    end
    return redirect_to '/home/requests'
  end

  def deleteRequest friend_id
    FriendRequest.where(sender_id: friend_id, reciever_id: current_user.id)[0].delete
  end

  # def isFriend(friend_id)
  #   return (Friend.where(friend1_id: friend_id, friend2_id: current_user.id).count + Friend.where(friend1_id: current_user.id, friend2_id: friend_id).count) > 0
  # end
end
