class CreateSleepRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_records do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :sleep_at
      t.datetime :wake_up_at
      t.integer :length_of_sleep

      t.timestamps
    end
  end
end
