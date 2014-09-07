require 'test_helper'

class GroupChatListsControllerTest < ActionController::TestCase
  setup do
    @group_chat_list = group_chat_lists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_chat_lists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_chat_list" do
    assert_difference('GroupChatList.count') do
      post :create, group_chat_list: { name: @group_chat_list.name }
    end

    assert_redirected_to group_chat_list_path(assigns(:group_chat_list))
  end

  test "should show group_chat_list" do
    get :show, id: @group_chat_list
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_chat_list
    assert_response :success
  end

  test "should update group_chat_list" do
    patch :update, id: @group_chat_list, group_chat_list: { name: @group_chat_list.name }
    assert_redirected_to group_chat_list_path(assigns(:group_chat_list))
  end

  test "should destroy group_chat_list" do
    assert_difference('GroupChatList.count', -1) do
      delete :destroy, id: @group_chat_list
    end

    assert_redirected_to group_chat_lists_path
  end
end
