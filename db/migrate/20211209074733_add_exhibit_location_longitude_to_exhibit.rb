class AddExhibitLocationLongitudeToExhibit < ActiveRecord::Migration[6.0]
  def change
    add_column :exhibits, :exhibit_location_longitude, :float
  end
end
