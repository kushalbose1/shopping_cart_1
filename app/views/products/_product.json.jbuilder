json.extract! product, :id, :product_name, :product_price, :product_description, :quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
