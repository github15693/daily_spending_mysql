json.array!(@roles) do |role|
  json.extract! role, :id, :name, :desciption, :enabled
  json.url role_url(role, format: :json)
end
