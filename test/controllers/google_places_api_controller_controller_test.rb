require 'test_helper'

class GooglePlacesApiControllerControllerTest < ActionController::TestCase
  test "should get get_places" do
    get :get_places
    assert_response :success
  end

end
