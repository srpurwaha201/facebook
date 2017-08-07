# Preview all emails at http://localhost:3000/rails/mailers/comment_mailer
class CommentMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/comment_mailer/send_comment_mail
  def send_comment_mail
    CommentMailer.send_comment_mail
  end

end
