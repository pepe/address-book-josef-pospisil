json.extract! email, :id, :address, :comment, :person_id, :created_at, :updated_at
json.url email_url(email, format: :json)
