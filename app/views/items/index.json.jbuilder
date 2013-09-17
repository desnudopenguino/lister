json.array!(@items) do |item|
  json.extract! item, :name, :list_id
  json.url item_url(item, format: :json)
end
