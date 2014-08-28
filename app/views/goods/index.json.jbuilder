json.array!(@goods) do |good|
  json.extract! good, :id, :name, :price
  json.url good_url(good, format: :json)
end
