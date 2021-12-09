class AddExhibitLocationLatitudeToExhibit < ActiveRecord::Migration[6.0]
  def change
    add_column :exhibits, :exhibit_location_latitude, :float
  end
end
