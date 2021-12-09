class AddStatusReferenceToRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :requests, :approval_statuses, column: :status_id
    add_index :requests, :status_id
    change_column_null :requests, :status_id, false
  end
end
