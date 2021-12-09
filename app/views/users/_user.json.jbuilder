json.extract! user, :id, :first_name, :last_name, :email_address, :password, :home_city, :home_state, :home_country, :user_image, :user_bio, :user_type_id, :demographic_id, :created_at, :updated_at
json.url user_url(user, format: :json)
