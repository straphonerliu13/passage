class AddCommenterReferenceToAttractionComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :attraction_comments, :users, column: :commenter_id
    add_index :attraction_comments, :commenter_id
    change_column_null :attraction_comments, :commenter_id, false
  end
end
