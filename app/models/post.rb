class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true

  def likes_count
    Like.where(like_type: 'post', like_id: self.id).count
  end

  def is_liked? id
    Like.where(like_type: 'post', like_id: self.id, user_id: id).count > 0
  end
end
