require "test_helper"

class UserIllnessesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_illnesses_new_url
    assert_response :success
  end

  test "should get create" do
    get user_illnesses_create_url
    assert_response :success
  end
end
