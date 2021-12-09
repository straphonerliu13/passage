class VisitorDemographicResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :demographic_name, :string
  attribute :demographic_description, :string

  # Direct associations

  # Indirect associations

end
