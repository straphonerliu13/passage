class Exhibit < ApplicationRecord
  # Direct associations

  has_many   :requests,
             :dependent => :destroy

  has_many   :recordings,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :exhibit_comments,
             :dependent => :destroy

  belongs_to :attraction

  # Indirect associations

  has_one    :modification_request,
             :through => :attraction,
             :source => :modification_requests

  # Validations

  # Scopes

  def to_s
    exhibit_name
  end

end
