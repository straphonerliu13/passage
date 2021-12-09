class ApprovalStatus < ApplicationRecord
  enum status_name: {"pending_approved_declined"=>0} 

  # Direct associations

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    status_name
  end

end
