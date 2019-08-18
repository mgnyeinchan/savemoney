require 'test_helper'

class SavemoneysControllerTest < ActionDispatch::IntegrationTest
  test "should get savemoney" do
    get savemoneys_savemoney_url
    assert_response :success
  end

end
