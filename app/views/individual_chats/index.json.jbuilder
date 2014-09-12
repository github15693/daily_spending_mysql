json.array!(@individual_chats) do |individual_chat|
  json.extract! individual_chat, :id, :sending_user, :receiving_user, :message
  json.url individual_chat_url(individual_chat, format: :json)
end
