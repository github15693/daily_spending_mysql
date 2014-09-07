json.array!(@group_chats) do |group_chat|
  json.extract! group_chat, :id, :message
  json.url group_chat_url(group_chat, format: :json)
end
