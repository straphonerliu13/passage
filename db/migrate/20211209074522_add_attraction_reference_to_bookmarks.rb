class AddAttractionReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :attractions
    add_index :bookmarks, :attraction_id
    change_column_null :bookmarks, :attraction_id, false
  end
end
