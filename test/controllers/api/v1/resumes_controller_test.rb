require "test_helper"

class Api::V1::ResumesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_resumes_create_url
    assert_response :success
  end

  test "should get update" do
    get api_v1_resumes_update_url
    assert_response :success
  end
end
