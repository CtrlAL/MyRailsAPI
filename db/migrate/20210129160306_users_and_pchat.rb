class UsersAndPchat < ActiveRecord::Migration[6.0]
    def change
     create_table :pchats_users, id: false do |t|
       t.belongs_to :user
       t.belongs_to :pchat
     end
   end
end
