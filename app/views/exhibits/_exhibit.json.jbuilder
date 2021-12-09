json.extract! exhibit, :id, :exhibit_name, :attraction_id, :exhibit_description, :exhibit_image, :exhibit_location, :status_id, :created_at, :updated_at
json.url exhibit_url(exhibit, format: :json)
