class AddAttractionLocationLatitudeToAttraction < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :attraction_location_latitude, :float
  end
end
