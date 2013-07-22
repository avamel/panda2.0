require 'test_helper'

class WeatherControllerTest < ActionController::TestCase
  test "should get forecast" do
    get :forecast
    assert_response :success
  end

end
