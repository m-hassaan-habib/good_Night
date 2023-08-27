class CreateFollowings < ActiveRecord::Migration[7.0]
  def change
    create_table :followings do |t|
      t.references :follower, null: false
      t.references :followee, null: false

      t.timestamps
    end
  end
end
