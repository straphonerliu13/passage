class Attraction < ApplicationRecord
  # Direct associations

  belongs_to :attraction_category

  has_many   :requests,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  has_many   :exhibits,
             :dependent => :destroy

  has_many   :attraction_comments,
             :dependent => :destroy

  # Indirect associations

  has_many   :modification_requests,
             :through => :exhibits,
             :source => :requests

  # Validations

  # Scopes

  def to_s
    attraction_name
  end

end
