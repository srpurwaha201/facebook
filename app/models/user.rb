class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy

  def full_name
    self.first_name + " " + self.last_name
  end
  def isFriendable? currentuserid
    currentuserid != self.id
  end

  def requestSent? sender_id
    FriendRequest.where(sender_id: sender_id , reciever_id: self.id).count != 0
  end

  def isFriend? friend_id
    return (Friend.where(friend1_id: friend_id, friend2_id: self.id).count + Friend.where(friend1_id: self.id, friend2_id: friend_id).count) > 0
  end

  def profile_pic_path
    if self.profile_picture
        return "/uploads/" + self.profile_picture
    else
        return "default_profile_image.png"
    end
  end
end
