json.extract! product, :id, :product_name, :product_details, :product_price, :product_quantity, :created_at, :updated_at
json.url product_url(product, format: :json)
