require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get createindex" do
    get favorites_createindex_url
    assert_response :success
  end

  test "should get destroy" do
    get favorites_destroy_url
    assert_response :success
  end

end
