require "test_helper"

class Public::TrainingSetsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_training_sets_index_url
    assert_response :success
  end

  test "should get show" do
    get public_training_sets_show_url
    assert_response :success
  end
end
