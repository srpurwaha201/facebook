class CommentMailerWorker
  @queue = :comment_mails_queue

  def self.perform (comment_id)
    CommentMailer.send_comment_mail(comment_id).deliver_now
  end
end