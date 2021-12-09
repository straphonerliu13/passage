class Recording < ApplicationRecord
  # Direct associations

  belongs_to :exhibit

  # Indirect associations

  has_one    :attraction,
             :through => :exhibit,
             :source => :attraction

  # Validations

  # Scopes

  def to_s
    created_at
  end

end
