class CreateUpdates < ActiveRecord::Migration[5.2]
  def change
    create_table :updates do |t|
      t.timestamp :created_at
      t.integer :followers
      t.integer :external_id
      t.text :message
      t.float :sentiment
      t.timestamp :updated_at
      t.string :user_handle

      t.timestamps
    end
  end
end
