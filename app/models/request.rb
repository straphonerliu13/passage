class Request < ApplicationRecord
  # Direct associations

  belongs_to :status,
             :class_name => "ApprovalStatus"

  belongs_to :exhibit

  belongs_to :attraction

  belongs_to :approver,
             :class_name => "User"

  # Indirect associations

  has_one    :main_attraction,
             :through => :exhibit,
             :source => :attraction

  has_one    :main_exhibit,
             :through => :main_attraction,
             :source => :exhibits

  # Validations

  # Scopes

  def to_s
    request_name
  end

end
