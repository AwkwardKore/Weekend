require 'test_helper'

class SessionsAdminControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
