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
  # test "the truth" do
  #   assert true
  # end
end
