class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email_address
      t.string :password
      t.string :home_city
      t.string :home_state
      t.string :home_country
      t.string :user_image
      t.text :user_bio
      t.integer :user_type_id
      t.integer :demographic_id

      t.timestamps
    end
  end
end
