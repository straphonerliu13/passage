class AddApproverReferenceToRequests < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :requests, :users, column: :approver_id
    add_index :requests, :approver_id
    change_column_null :requests, :approver_id, false
  end
end
