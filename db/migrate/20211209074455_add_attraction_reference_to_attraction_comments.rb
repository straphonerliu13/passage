class AddAttractionReferenceToAttractionComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attraction_comments, :attractions
    add_index :attraction_comments, :attraction_id
    change_column_null :attraction_comments, :attraction_id, false
  end
end
