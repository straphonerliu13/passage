require 'open-uri'
class Exhibit < ApplicationRecord
  before_validation :geocode_exhibit_location

  def geocode_exhibit_location
    if self.exhibit_location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.exhibit_location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.exhibit_location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.exhibit_location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.exhibit_location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_uploader :exhibit_image, ExhibitImageUploader

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

  has_many   :users,
             :through => :bookmarks,
             :source => :user

  has_one    :modification_request,
             :through => :attraction,
             :source => :modification_requests

  # Validations

  # Scopes

  def to_s
    exhibit_name
  end

end
