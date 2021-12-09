class AttractionResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :attraction_name, :string
  attribute :attraction_location, :string
  attribute :attraction_description, :string
  attribute :attraction_image, :string
  attribute :status_id, :integer
  attribute :phone_number, :string
  attribute :email_address, :string
  attribute :hours_of_operation, :string
  attribute :cost_of_entry, :string
  attribute :attraction_category_id, :integer

  # Direct associations

  has_many   :bookmarks

  has_many   :exhibits

  has_many   :attraction_comments

  # Indirect associations

end
