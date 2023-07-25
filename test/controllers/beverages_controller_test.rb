require "test_helper"

class BeveragesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beverages_index_url
    assert_response :success
  end

  test "should get show" do
    get beverages_show_url
    assert_response :success
  end
end
