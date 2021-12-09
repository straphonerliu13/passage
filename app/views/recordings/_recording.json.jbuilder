json.extract! recording, :id, :exhibit_id, :audio_upload, :video_upload,
              :created_at, :updated_at
json.url recording_url(recording, format: :json)
