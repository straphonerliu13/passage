class UserTypeResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_type, :string_enum, allow: UserType.user_types.keys

  # Direct associations

  # Indirect associations

end
