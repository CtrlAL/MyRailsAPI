class AddUsersToChat < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :users, :queue
    add_index :chats, :users
  end
end
