require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "newsletter" do
    mail = UserMailer.newsletter
    assert_equal "Newsletter", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
