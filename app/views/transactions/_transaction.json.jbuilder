json.extract! transaction, :id, :transaction_type, :item_id, :user_id, :notes, :loan_time, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
