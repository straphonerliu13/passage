class CreateAttractions < ActiveRecord::Migration[6.0]
  def change
    create_table :attractions do |t|
      t.string :attraction_name
      t.string :attraction_location
      t.text :attraction_description
      t.string :attraction_image
      t.integer :status_id
      t.string :phone_number
      t.string :email_address
      t.string :hours_of_operation
      t.string :cost_of_entry
      t.integer :attraction_category_id

      t.timestamps
    end
  end
end
