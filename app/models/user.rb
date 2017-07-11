class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy

  def isFriendable? currentuserid
    currentuserid != self.id
  end

  def requestSent? sender_id
    FriendRequest.where(sender_id: sender_id , reciever_id: self.id).count != 0
  end

  def isFriend? friend_id
    return (Friend.where(friend1_id: friend_id, friend2_id: self.id).count + Friend.where(friend1_id: self.id, friend2_id: friend_id).count) > 0
  end
end
