json.extract! exhibit_comment, :id, :commenter_id, :exhibit_id, :comment_text,
              :created_at, :updated_at
json.url exhibit_comment_url(exhibit_comment, format: :json)
