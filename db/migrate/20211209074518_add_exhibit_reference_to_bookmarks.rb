class AddExhibitReferenceToBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :bookmarks, :exhibits
    add_index :bookmarks, :exhibit_id
    change_column_null :bookmarks, :exhibit_id, false
  end
end
