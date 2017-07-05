require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get check_email" do
    get :check_email
    assert_response :success
  end

end
