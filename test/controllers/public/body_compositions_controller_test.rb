require "test_helper"

class Public::BodyCompositionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_body_compositions_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_body_compositions_edit_url
    assert_response :success
  end
end
