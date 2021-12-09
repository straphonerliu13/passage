json.extract! attraction_comment, :id, :commenter_id, :attraction_id, :comment_text, :created_at, :updated_at
json.url attraction_comment_url(attraction_comment, format: :json)
