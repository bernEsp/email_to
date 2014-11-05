require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  test "response error to html request" do
    post :create, format: :html
    assert_response 422
  end
  
  test "response a basic structure on error" do
    post :create, format: :html
    assert_equal "{to: jhon@example.com[,bill@example.com], subject: test, body: test}", response.body
  end

  test "send email" do
    post :create, to: "bernardo466@gmail.com", subject: "Hello world", body: "Hi Matte! Sending you an email via this API I just made", format: :json
    assert_response :success
  end
  
  test "send email to multiples recipients" do
    post :create, to: "bernardo466@gmail.com,test@example.com", subject: "Hello world", body: "Hi Matte! Sending you an email via this API I just made", format: :json
    assert_response :success
  end
  
  test "send email to multiples recipients with name" do
    post :create, to: "bernardo galindo <bernardo466@gmail.com>,tester <test@example.com>", subject: "Hello world", body: "Hi Matte! Sending you an email via this API I just made", format: :json
    assert_equal ["bernardo galindo <bernardo466@gmail.com>", "tester <test@example.com>"], JSON.parse(response.body)
  end
  
  test "send email return error to multiples recipients split by space recipients structure" do
    post :create, to: "bernardo466@gmail.com test@example.com", subject: "Hello world", body: "Hi Matte! Sending you an email via this API I just made", format: :json
    assert_equal "please send this structure {to: jhon@example.com[,bill@example.com], subject: test, body: test}", response.body
  end

  test "send email return error to multiples recipients split by semicolon as incorrect recipients structure" do
    post(:create, to: "bernardo466@gmail.com;test@example.com", subject: "Hello world", body: "Hi Matte! Sending you an email via this API I just made", format: :json)
    assert_equal "please send this structure {to: jhon@example.com[,bill@example.com], subject: test, body: test}", response.body
  end
end
