require 'test_helper'

class ModerationControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
