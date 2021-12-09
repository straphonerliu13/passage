class CreateUserTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :user_types do |t|
      t.integer :user_type

      t.timestamps
    end
  end
end
