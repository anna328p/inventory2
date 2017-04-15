json.extract! item, :id, :item_type_id, :inst_num, :checked_out, :user_id, :notes, :created_at, :updated_at
json.url item_url(item, format: :json)
