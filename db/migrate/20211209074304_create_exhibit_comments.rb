class CreateExhibitComments < ActiveRecord::Migration[6.0]
  def change
    create_table :exhibit_comments do |t|
      t.integer :commenter_id
      t.integer :exhibit_id
      t.text :comment_text

      t.timestamps
    end
  end
end
