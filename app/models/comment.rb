class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  after_create :send_new_comment_mail

  def likes_count
    Like.where(like_type: 'comment', like_id: self.id).count
  end

  def is_liked? id
    Like.where(like_type: 'comment', like_id: self.id, user_id: id).count > 0
  end

  def send_new_comment_mail
    CommentMailer.send_comment_mail(id).deliver_now
  end

end
