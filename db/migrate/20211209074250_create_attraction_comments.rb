class CreateAttractionComments < ActiveRecord::Migration[6.0]
  def change
    create_table :attraction_comments do |t|
      t.integer :commenter_id
      t.integer :attraction_id
      t.text :comment_text

      t.timestamps
    end
  end
end
