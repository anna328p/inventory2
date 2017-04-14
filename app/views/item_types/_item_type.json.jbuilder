json.extract! item_type, :id, :code, :name, :description, :created_at, :updated_at
json.url item_type_url(item_type, format: :json)
