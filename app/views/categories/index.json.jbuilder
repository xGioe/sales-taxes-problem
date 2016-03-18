json.array!(@categories) do |category|
  json.extract! category, :id, :cat_name, :tax_fee, :fee_free
  json.url category_url(category, format: :json)
end
