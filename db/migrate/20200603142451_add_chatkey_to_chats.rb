class AddChatkeyToChats < ActiveRecord::Migration[6.0]
  def change
    add_column :chats, :chatkey, :string
    add_index :chats, :chatkey
  end
end
