class AddExhibitReferenceToExhibitComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :exhibit_comments, :exhibits
    add_index :exhibit_comments, :exhibit_id
    change_column_null :exhibit_comments, :exhibit_id, false
  end
end
