json.extract! transaction, :id, :type, :notes, :user_id, :item_id, :loan_days, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
