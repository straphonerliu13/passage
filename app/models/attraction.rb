class Attraction < ApplicationRecord
  # Direct associations

  has_many   :attraction_comments,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    attraction_name
  end

end
