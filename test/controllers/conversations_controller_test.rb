require 'test_helper'

class ConversationsControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get reply" do
    get :reply
    assert_response :success
  end

  test "should get move_to_trash" do
    get :move_to_trash
    assert_response :success
  end

  test "should get restore" do
    get :restore
    assert_response :success
  end

  test "should get delete" do
    get :delete
    assert_response :success
  end

  test "should get start" do
    get :start
    assert_response :success
  end

end
