class AddAttractionCategoryReferenceToAttractions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attractions, :attraction_categories
    add_index :attractions, :attraction_category_id
    change_column_null :attractions, :attraction_category_id, false
  end
end
