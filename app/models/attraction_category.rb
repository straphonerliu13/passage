class AttractionCategory < ApplicationRecord
  enum category_description: {"museum_landmark_park_thrill_government_other"=>0} 

  enum category_type: {"landmark_museum_park_thrill"=>0} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category_type
  end

end
