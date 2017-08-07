class CommentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.comment_mailer.send_comment_mail.subject
  #
  def send_comment_mail comment_id
    @comment = Comment.find(comment_id)

    mail to: @comment.post.user.email, subject: "New comment on your post"
  end
end
