class CreateAttractionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :attraction_categories do |t|
      t.integer :category_type
      t.integer :category_description
      t.string :target_demographic

      t.timestamps
    end
  end
end
