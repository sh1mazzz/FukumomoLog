require "test_helper"

class SugarGlidersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sugar_gliders_new_url
    assert_response :success
  end

  test "should get create" do
    get sugar_gliders_create_url
    assert_response :success
  end

  test "should get show" do
    get sugar_gliders_show_url
    assert_response :success
  end
end
