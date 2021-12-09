class Recording < ApplicationRecord
  # Direct associations

  belongs_to :exhibit

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
