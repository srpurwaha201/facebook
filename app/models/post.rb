class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def likes_count
    Like.where(like_type: 'post', like_id: self.id).count
  end

  def is_liked? id
    Like.where(like_type: 'post', like_id: self.id, user_id: id).count > 0
  end

  def comments
    Comment.where(post_id: self.id).order(created_at: :desc)
  end
end
