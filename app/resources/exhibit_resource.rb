class ExhibitResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :exhibit_name, :string
  attribute :attraction_id, :integer
  attribute :exhibit_description, :string
  attribute :exhibit_image, :string
  attribute :exhibit_location, :string
  attribute :status_id, :integer

  # Direct associations

  has_many   :requests

  has_many   :recordings

  has_many   :bookmarks

  has_many   :exhibit_comments

  belongs_to :attraction

  # Indirect associations

  has_one    :modification_request,
             resource: RequestResource
end
