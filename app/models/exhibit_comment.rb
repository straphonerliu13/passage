class ExhibitComment < ApplicationRecord
  # Direct associations

  belongs_to :exhibit

  belongs_to :commenter,
             class_name: "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    commenter.to_s
  end
end
