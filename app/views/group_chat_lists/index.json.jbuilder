json.array!(@group_chat_lists) do |group_chat_list|
  json.extract! group_chat_list, :id, :name
  json.url group_chat_list_url(group_chat_list, format: :json)
end
