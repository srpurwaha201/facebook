require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  test "should get toggle_like" do
    get :toggle_like
    assert_response :success
  end

end
