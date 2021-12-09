class User < ApplicationRecord
  # Direct associations

  has_many   :attraction_comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    first_name
  end

end
