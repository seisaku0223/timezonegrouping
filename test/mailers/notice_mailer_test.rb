require 'test_helper'

class NoticeMailerTest < ActionMailer::TestCase
  test "sendmail_registration" do
    mail = NoticeMailer.sendmail_registration
    assert_equal "Sendmail registration", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
