require 'test_helper'

class EmailsRouteTest < ActionDispatch::IntegrationTest
  test "should route to send via post" do
    assert_routing({method:'post', path: 'send'}, {controller: "emails", action: "create"})
  end

  test "index should response" do
    assert_routing '/', controller: "emails", action: "index"
  end
end
