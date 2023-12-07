require "test_helper"

class Public::PostControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_post_index_url
    assert_response :success
  end

  test "should get show" do
    get public_post_show_url
    assert_response :success
  end
end
