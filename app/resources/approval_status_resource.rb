class ApprovalStatusResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :status_name, :string_enum, allow: ApprovalStatus.status_names.keys

  # Direct associations

  has_many   :requests,
             foreign_key: :status_id

  # Indirect associations

end
