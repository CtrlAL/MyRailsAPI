class AddChatidToPchat < ActiveRecord::Migration[6.0]
  def change
    add_column :pchats, :chatid, :string
  end
end
