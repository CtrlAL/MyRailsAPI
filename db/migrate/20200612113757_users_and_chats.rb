class UsersAndChats < ActiveRecord::Migration[6.0]
  def change
   create_table :chats_users, id: false do |t|
     t.belongs_to :user
     t.belongs_to :chat
   end
 end
end
