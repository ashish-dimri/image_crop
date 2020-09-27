require 'test_helper'

class CropperControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cropper_index_url
    assert_response :success
  end

end
