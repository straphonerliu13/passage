class AttractionCategoryResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :category_type, :string_enum, allow: AttractionCategory.category_types.keys
  attribute :category_description, :string_enum, allow: AttractionCategory.category_descriptions.keys
  attribute :target_demographic, :string

  # Direct associations

  # Indirect associations

end
