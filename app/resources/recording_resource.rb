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

  has_one    :attraction

  filter :attraction_id, :integer do
    eq do |scope, value|
      scope.eager_load(:attraction).where(exhibits: { attraction_id: value })
    end
  end
end
