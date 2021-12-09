class CreateExhibits < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibits do |t|
      t.string :exhibit_name
      t.integer :attraction_id
      t.text :exhibit_description
      t.string :exhibit_image
      t.string :exhibit_location
      t.integer :status_id

      t.timestamps
    end
  end
end
