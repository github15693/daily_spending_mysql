require 'test_helper'

class GroupChatsControllerTest < ActionController::TestCase
  setup do
    @group_chat = group_chats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:group_chats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create group_chat" do
    assert_difference('GroupChat.count') do
      post :create, group_chat: { message: @group_chat.message }
    end

    assert_redirected_to group_chat_path(assigns(:group_chat))
  end

  test "should show group_chat" do
    get :show, id: @group_chat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @group_chat
    assert_response :success
  end

  test "should update group_chat" do
    patch :update, id: @group_chat, group_chat: { message: @group_chat.message }
    assert_redirected_to group_chat_path(assigns(:group_chat))
  end

  test "should destroy group_chat" do
    assert_difference('GroupChat.count', -1) do
      delete :destroy, id: @group_chat
    end

    assert_redirected_to group_chats_path
  end
end
