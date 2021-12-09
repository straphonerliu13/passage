class VisitorDemographic < ApplicationRecord
  # Direct associations

  has_many   :users,
             :foreign_key => "demographic_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    demographic_name
  end

end
