class UserType < ApplicationRecord
  enum user_type: {"traveler_admin_partner"=>0} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user_type
  end

end
