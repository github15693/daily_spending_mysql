json.array!(@friend_lists) do |friend_list|
  json.extract! friend_list, :id, :request_user, :confirm_user, :is_confirm
  json.url friend_list_url(friend_list, format: :json)
end
