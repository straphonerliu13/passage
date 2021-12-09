class AddAttractionLocationFormattedAddressToAttraction < ActiveRecord::Migration[6.0]
  def change
    add_column :attractions, :attraction_location_formatted_address, :string
  end
end
