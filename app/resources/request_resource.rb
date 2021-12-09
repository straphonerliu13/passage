class RequestResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :request_name, :string
  attribute :request_description, :string
  attribute :status_id, :integer
  attribute :approver_id, :integer
  attribute :requestor_id, :integer
  attribute :exhibit_id, :integer
  attribute :attraction_id, :integer

  # Direct associations

  # Indirect associations

end