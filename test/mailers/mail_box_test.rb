require 'test_helper'

class MailBoxTest < ActionMailer::TestCase
  test "default from" do
    email = MailBox.add({to: "test@s.com"})
    assert_equal ["noreplay@example.com"], email.from
  end

  test "email to" do
    email = MailBox.add({to: "test@s.com"})
    assert_equal ["test@s.com"], email.to
  end
  
  test "email body" do
    email = MailBox.add({to: "test@s.com", body: "testing"})
    assert_equal "testing", email.body.to_s
  end
  # test "the truth" do
  #   assert true
  # end
end
