class CreateRecordings < ActiveRecord::Migration[6.0]
  def change
    create_table :recordings do |t|
      t.integer :exhibit_id
      t.string :audio_upload
      t.string :video_upload

      t.timestamps
    end
  end
end
