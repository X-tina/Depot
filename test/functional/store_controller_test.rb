require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get inde[" do
    get :index
    assert_response :success
  end

end
