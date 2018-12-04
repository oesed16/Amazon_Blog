require 'test_helper'

class Blog2ControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get blog2_index_url
    assert_response :success
  end

  test "should get new" do
    get blog2_new_url
    assert_response :success
  end

  test "should get show" do
    get blog2_show_url
    assert_response :success
  end

  test "should get edit" do
    get blog2_edit_url
    assert_response :success
  end

end
