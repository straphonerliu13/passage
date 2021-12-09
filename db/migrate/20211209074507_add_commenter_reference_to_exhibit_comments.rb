class AddCommenterReferenceToExhibitComments < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :exhibit_comments, :users, column: :commenter_id
    add_index :exhibit_comments, :commenter_id
    change_column_null :exhibit_comments, :commenter_id, false
  end
end
