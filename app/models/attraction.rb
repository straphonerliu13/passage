require 'open-uri'
class Attraction < ApplicationRecord
  before_validation :geocode_attraction_location

  def geocode_attraction_location
    if self.attraction_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.attraction_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.attraction_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.attraction_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.attraction_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
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
