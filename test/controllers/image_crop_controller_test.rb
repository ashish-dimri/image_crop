require 'test_helper'

class ImageCropControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get image_crop_index_url
    assert_response :success
  end

end
