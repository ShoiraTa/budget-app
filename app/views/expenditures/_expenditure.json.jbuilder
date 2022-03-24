json.extract! expenditure, :id, :name, :amount, :user_id, :group_id, :created_at, :updated_at
json.url expenditure_url(expenditure, format: :json)
