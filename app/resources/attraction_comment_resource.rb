class AttractionCommentResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :commenter_id, :integer
  attribute :attraction_id, :integer
  attribute :comment_text, :string

  # Direct associations

  belongs_to :attraction

  belongs_to :commenter,
             resource: UserResource

  # Indirect associations

end
