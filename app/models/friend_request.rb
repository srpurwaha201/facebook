class FriendRequest < ActiveRecord::Base
  def sender
    User.find(self.sender_id)
  end
end
