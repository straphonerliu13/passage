json.extract! bookmark, :id, :user_id, :exhibit_id, :attraction_id,
              :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)
