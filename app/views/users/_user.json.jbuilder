json.extract! user, :id, :email, :username, :password_digest, :confirmed, :active, :created_at, :updated_at
json.url user_url(user, format: :json)
