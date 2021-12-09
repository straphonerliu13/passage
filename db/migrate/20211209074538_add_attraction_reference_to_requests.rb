class AddAttractionReferenceToRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :requests, :attractions
    add_index :requests, :attraction_id
    change_column_null :requests, :attraction_id, false
  end
end
