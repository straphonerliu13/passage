class Exhibit < ApplicationRecord
  # Direct associations

  has_many   :exhibit_comments,
             :dependent => :destroy

  belongs_to :attraction

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    exhibit_name
  end

end
