class UserController < ApplicationController
  def newRequest
    request = FriendRequest.new
    request.sender_id = current_user.id
    request.reciever_id = params[:reciever_id]
    request.save
    return redirect_to '/users'
  end

  def acceptRequest
    @newFriends = Friend.new
    @newFriends.friend1_id = current_user.id
    @newFriends.friend2_id = params[:friend2_id]
    @newFriends.save
    deleteRequest params[:friend2_id]
    return redirect_to '/home/requests'
  end

  def deleteRequest friend_id
    FriendRequest.where(sender_id: friend_id, reciever_id: current_user.id)[0].delete
  end

  def declineRequest
    deleteRequest params[:friend2_id]
    return redirect_to '/home/requests'
  end

  def unFriend
    if Friend.where(friend1_id: current_user.id, friend2_id: params[:friend_id]).count > 0
      Friend.where(friend1_id: current_user.id, friend2_id: params[:friend_id])[0].delete
    else
      Friend.where(friend2_id: current_user.id, friend1_id: params[:friend_id])[0].delete
    end
    return redirect_to '/friends'
  end
  # def isFriend(friend_id)
  #   return (Friend.where(friend1_id: friend_id, friend2_id: current_user.id).count + Friend.where(friend1_id: current_user.id, friend2_id: friend_id).count) > 0
  # end
end
