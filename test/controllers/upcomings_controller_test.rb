require 'test_helper'

class UpcomingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get upcomings_show_url
    assert_response :success
  end

end
