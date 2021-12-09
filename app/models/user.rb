class User < ApplicationRecord
  mount_uploader :user_image, UserImageUploader

  # Direct associations

  belongs_to :demographic,
             class_name: "VisitorDemographic"

  belongs_to :user_type

  has_many   :requests,
             foreign_key: "approver_id",
             dependent: :destroy

  has_many   :bookmarks,
             dependent: :destroy

  has_many   :exhibit_comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  has_many   :attraction_comments,
             foreign_key: "commenter_id",
             dependent: :destroy

  # Indirect associations

  has_many   :attractions,
             through: :bookmarks,
             source: :attraction

  has_many   :exhibits,
             through: :bookmarks,
             source: :exhibit

  # Validations

  # Scopes

  def to_s
    first_name
  end
end
