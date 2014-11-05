require 'test_helper'

class MailBoxTest < ActionMailer::TestCase
  test "default from" do
    email = MailBox.add("test@s.com")
    assert_equal ["noreplay@example.com"], email.from
  end

  test "email to" do
    email = MailBox.add("test@s.com")
    assert_equal ["test@s.com"], email.to
  end
  
  test "email body" do
    email = MailBox.add("test@s.com", {body: "testing"})
    assert_equal "testing", email.body.to_s
  end

  test "email subject" do
    email = MailBox.add("test@s.com",{body: "testing", subject: "testing"})
    assert_equal "testing", email.subject
  end

  test "email delivery" do
    email = MailBox.add("test@s.com",{body: "testing"}).deliver
    assert_equal false, ActionMailer::Base.deliveries.empty?
  end

  test "emails without body" do
    email = MailBox.add("test@s.com", {body: "", subject: "testing"})
    assert_equal "", email.body.to_s
  end
  
  test "email recipients with name" do
    email = MailBox.add("Bernardo Galindo <bernardo466@gmail.com>, Tester <test@example.com>", {body: "", subject: "testing"})
    assert_equal ["bernardo466@gmail.com", "test@example.com"], email.to
  end

  test "email recipients with email" do 
    email = MailBox.add("test@s.com,bernardo466@gmail.com", {body: "", subject: "testing"})
    assert_equal ["test@s.com", "bernardo466@gmail.com"], email.to
  end
end
