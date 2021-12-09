class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :request_name
      t.text :request_description
      t.integer :status_id
      t.integer :approver_id
      t.integer :requestor_id
      t.integer :exhibit_id
      t.integer :attraction_id

      t.timestamps
    end
  end
end
