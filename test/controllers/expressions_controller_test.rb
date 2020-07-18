require 'test_helper'

class ExpressionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get expressions_create_url
    assert_response :success
  end

end
