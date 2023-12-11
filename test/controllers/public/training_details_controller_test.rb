require "test_helper"

class Public::TrainingDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_training_details_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_training_details_edit_url
    assert_response :success
  end
end
