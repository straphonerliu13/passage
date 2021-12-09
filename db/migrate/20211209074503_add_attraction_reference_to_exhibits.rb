class AddAttractionReferenceToExhibits < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :exhibits, :attractions
    add_index :exhibits, :attraction_id
    change_column_null :exhibits, :attraction_id, false
  end
end
