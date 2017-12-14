require 'test_helper'

class ProfilePicturesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get profile_pictures_new_url
    assert_response :success
  end

  test "should get create" do
    get profile_pictures_create_url
    assert_response :success
  end

  test "should get update" do
    get profile_pictures_update_url
    assert_response :success
  end

end
