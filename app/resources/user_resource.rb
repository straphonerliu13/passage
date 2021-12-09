class UserResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :first_name, :string
  attribute :last_name, :string
  attribute :email_address, :string
  attribute :password, :string
  attribute :home_city, :string
  attribute :home_state, :string
  attribute :home_country, :string
  attribute :user_image, :string
  attribute :user_bio, :string
  attribute :user_type_id, :integer
  attribute :demographic_id, :integer

  # Direct associations

  has_many   :attraction_comments,
             foreign_key: :commenter_id

  # Indirect associations

end
