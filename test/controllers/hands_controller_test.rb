require 'test_helper'

class HandsControllerTest < ActionDispatch::IntegrationTest
  test "should get rule" do
    get hands_rule_url
    assert_response :success
  end

end
