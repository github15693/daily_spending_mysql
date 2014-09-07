require 'test_helper'

class FriendListsControllerTest < ActionController::TestCase
  setup do
    @friend_list = friend_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friend_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friend_list" do
    assert_difference('FriendList.count') do
      post :create, friend_list: { confirm_user: @friend_list.confirm_user, is_confirm: @friend_list.is_confirm, request_user: @friend_list.request_user }
    end

    assert_redirected_to friend_list_path(assigns(:friend_list))
  end

  test "should show friend_list" do
    get :show, id: @friend_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friend_list
    assert_response :success
  end

  test "should update friend_list" do
    patch :update, id: @friend_list, friend_list: { confirm_user: @friend_list.confirm_user, is_confirm: @friend_list.is_confirm, request_user: @friend_list.request_user }
    assert_redirected_to friend_list_path(assigns(:friend_list))
  end

  test "should destroy friend_list" do
    assert_difference('FriendList.count', -1) do
      delete :destroy, id: @friend_list
    end

    assert_redirected_to friend_lists_path
  end
end
