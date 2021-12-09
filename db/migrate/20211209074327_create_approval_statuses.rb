class CreateApprovalStatuses < ActiveRecord::Migration[6.0]
  def change
    create_table :approval_statuses do |t|
      t.integer :status_name

      t.timestamps
    end
  end
end
