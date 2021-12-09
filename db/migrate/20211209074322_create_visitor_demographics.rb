class CreateVisitorDemographics < ActiveRecord::Migration[6.0]
  def change
    create_table :visitor_demographics do |t|
      t.string :demographic_name
      t.text :demographic_description

      t.timestamps
    end
  end
end
