class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :posts, dependent: :destroy
  has_many :comments, through: :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  before_save :capitalize_names, :initialise_full_name, :create_permalink
  def to_param
    permalink
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
        # return "/assets/images/default_profile_image.png"
        return ActionController::Base.helpers.asset_path("default_profile_image.png")
    end
  end

  def feed
    feed = self.posts
    friends = self.friends
    friends.each do |friend|
      feed = feed + friend.posts
    end
    feed = feed.sort_by { |obj| obj.updated_at }
    feed.reverse!
    return feed
  end

  def wall
      wall = self.posts
      self.friends.each do |friend|
        friend.posts.each do |post|
          if id == post.ref_user_id
            wall = wall + Array.new(1){post}
          end
        end
      end
      wall = wall.sort_by { |obj| obj.updated_at }
      wall.reverse!
      return wall
  end

  def friends
    friends = []
    friend_mappings = Friend.where(friend1_id: self.id) + Friend.where(friend2_id: self.id)
    friend_mappings.each do |friend_mapping|
      if friend_mapping.friend1_id == self.id
        friends << User.find(friend_mapping.friend2_id)
      else
        friends << User.find(friend_mapping.friend1_id)
      end
    end
    return friends
  end

  def requests
    FriendRequest.where(reciever_id: self.id)
  end

  # private

  def capitalize_names
    self.first_name = first_name.camelcase
    self.last_name = last_name.camelcase
  end

  def initialise_full_name
    self.full_name = self.first_name + " " + self.last_name
  end

  def create_permalink
    self.permalink = self.email.split("@")[0] + self.id.to_s
  end
end
