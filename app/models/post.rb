class Post < ActiveRecord::Base
  belongs_to :user, class_name: 'User'
  belongs_to :ref_user, class_name: 'User'
  has_many :comments, dependent: :destroy
  validates :content, presence: true
  has_attached_file :image, :url => '/assets/images/post/:id/:style/:basename.:extension',
                        :path => ':rails_root/public/assets/images/post/:id/:style/:basename.:extension', :dependent => :destroy

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
