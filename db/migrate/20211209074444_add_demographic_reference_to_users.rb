class AddDemographicReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :visitor_demographics, column: :demographic_id
    add_index :users, :demographic_id
    change_column_null :users, :demographic_id, false
  end
end
