require 'test_helper'

class IndividualChatsControllerTest < ActionController::TestCase
  setup do
    @individual_chat = individual_chats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:individual_chats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create individual_chat" do
    assert_difference('IndividualChat.count') do
      post :create, individual_chat: { message: @individual_chat.message, receiving_user: @individual_chat.receiving_user, sending_user: @individual_chat.sending_user }
    end

    assert_redirected_to individual_chat_path(assigns(:individual_chat))
  end

  test "should show individual_chat" do
    get :show, id: @individual_chat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @individual_chat
    assert_response :success
  end

  test "should update individual_chat" do
    patch :update, id: @individual_chat, individual_chat: { message: @individual_chat.message, receiving_user: @individual_chat.receiving_user, sending_user: @individual_chat.sending_user }
    assert_redirected_to individual_chat_path(assigns(:individual_chat))
  end

  test "should destroy individual_chat" do
    assert_difference('IndividualChat.count', -1) do
      delete :destroy, id: @individual_chat
    end

    assert_redirected_to individual_chats_path
  end
end
