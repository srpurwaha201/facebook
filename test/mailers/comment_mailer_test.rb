require 'test_helper'

class CommentMailerTest < ActionMailer::TestCase
  test "send_comment_mail" do
    mail = CommentMailer.send_comment_mail
    assert_equal "Send comment mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
