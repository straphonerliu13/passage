class AddExhibitReferenceToRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :requests, :exhibits
    add_index :requests, :exhibit_id
    change_column_null :requests, :exhibit_id, false
  end
end
