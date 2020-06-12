class CreateChatMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :chat_messages do |t|
      t.string :text
      t.belongs_to :user, foreign_key: true
      t.belongs_to :chat, foreign_key: true

      t.timestamps
    end
  end
end
