require 'test_helper'

class EmailsRouteTest < ActionDispatch::IntegrationTest
  test "should route to send via post" do
    assert_routing '/send', controller: "emails", action: "create"
  end
end
