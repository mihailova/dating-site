require 'test_helper'

class MessagingControllerTest < ActionController::TestCase
  test "should get inbox" do
    get :inbox
    assert_response :success
  end

  test "should get sentbox" do
    get :sentbox
    assert_response :success
  end

  test "should get trash" do
    get :trash
    assert_response :success
  end

end
