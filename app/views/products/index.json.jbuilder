json.array!(@products) do |product|
  json.extract! product, :id, :name, :price, :imported
  json.url product_url(product, format: :json)
end
