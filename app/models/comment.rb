class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def likes_count
    Like.where(like_type: 'comment', like_id: self.id).count
  end

  def is_liked? id
    Like.where(like_type: 'comment', like_id: self.id, user_id: id).count > 0
  end

end
