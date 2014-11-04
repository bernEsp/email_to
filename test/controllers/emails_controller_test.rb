require 'test_helper'

class EmailsControllerTest < ActionController::TestCase
  test "response success to json request" do
    post :create, format: :json
    assert_response :success
  end
  test "response error to html request" do
    post :create, format: :html
    assert_response 422
  end
end
