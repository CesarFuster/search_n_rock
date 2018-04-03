require 'test_helper'

class RentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rents_index_url
    assert_response :success
  end

  test "should get show" do
    get rents_show_url
    assert_response :success
  end

  test "should get new" do
    get rents_new_url
    assert_response :success
  end

  test "should get create" do
    get rents_create_url
    assert_response :success
  end

end
