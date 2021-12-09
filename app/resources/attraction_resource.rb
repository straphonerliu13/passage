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

  belongs_to :attraction_category

  has_many   :requests

  has_many   :bookmarks

  has_many   :exhibits

  has_many   :attraction_comments

  # Indirect associations

  has_many :modification_requests, resource: RequestResource do
    assign_each do |attraction, requests|
      requests.select do |r|
        r.id.in?(attraction.modification_requests.map(&:id))
      end
    end
  end

end
