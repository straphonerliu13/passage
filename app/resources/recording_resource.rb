class RecordingResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :exhibit_id, :integer
  attribute :audio_upload, :string
  attribute :video_upload, :string

  # Direct associations

  belongs_to :exhibit

  # Indirect associations

end
