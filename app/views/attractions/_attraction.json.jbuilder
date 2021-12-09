json.extract! attraction, :id, :attraction_name, :attraction_location, :attraction_description, :attraction_image, :status_id, :phone_number, :email_address, :hours_of_operation, :cost_of_entry, :attraction_category_id, :created_at, :updated_at
json.url attraction_url(attraction, format: :json)
