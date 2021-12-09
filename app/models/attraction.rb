class Attraction < ApplicationRecord
  mount_uploader :attraction_image, AttractionImageUploader

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

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  has_many   :recordings,
             :through => :exhibits,
             :source => :recordings

  has_many   :modification_requests,
             :through => :exhibits,
             :source => :requests

  # Validations

  # Scopes

  def to_s
    attraction_name
  end

end
