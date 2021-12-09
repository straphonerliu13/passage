class ApprovalStatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :status_name, :string_enum, allow: ApprovalStatus.status_names.keys

  # Direct associations

  # Indirect associations

end
