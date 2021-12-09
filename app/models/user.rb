class User < ApplicationRecord
  # Direct associations

  has_many   :requests,
             :foreign_key => "approver_id",
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :exhibit_comments,
             :foreign_key => "commenter_id",
             :dependent => :destroy

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
