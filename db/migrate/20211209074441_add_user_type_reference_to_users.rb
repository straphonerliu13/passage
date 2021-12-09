class AddUserTypeReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :user_types
    add_index :users, :user_type_id
    change_column_null :users, :user_type_id, false
  end
end
