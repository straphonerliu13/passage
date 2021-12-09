class Exhibit < ApplicationRecord
  # Direct associations

  belongs_to :attraction

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    exhibit_name
  end

end
