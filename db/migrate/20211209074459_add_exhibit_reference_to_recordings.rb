class AddExhibitReferenceToRecordings < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :recordings, :exhibits
    add_index :recordings, :exhibit_id
    change_column_null :recordings, :exhibit_id, false
  end
end
