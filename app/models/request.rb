class Request < ApplicationRecord
  # Direct associations

  belongs_to :attraction

  belongs_to :approver,
             :class_name => "User"

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    request_name
  end

end
