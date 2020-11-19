require 'test_helper'

class TwitterControllerTest < ActionDispatch::IntegrationTest
  test "should get twitter_client" do
    get twitter_twitter_client_url
    assert_response :success
  end

  test "should get index" do
    get twitter_index_url
    assert_response :success
  end

end
