require "test_helper"

class Admin::TrainingMenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_training_menus_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_training_menus_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_training_menus_edit_url
    assert_response :success
  end
end
