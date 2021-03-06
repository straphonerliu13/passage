class BookmarkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :exhibit_id, :integer
  attribute :attraction_id, :integer

  # Direct associations

  belongs_to :exhibit

  belongs_to :attraction

  belongs_to :user

  # Indirect associations
end
