class CreateSubscriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id
      t.integer :message_id

      t.timestamps
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :message_id
  end
end
