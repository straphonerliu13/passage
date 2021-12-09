class AddExhibitLocationFormattedAddressToExhibit < ActiveRecord::Migration[6.0]
  def change
    add_column :exhibits, :exhibit_location_formatted_address, :string
  end
end
