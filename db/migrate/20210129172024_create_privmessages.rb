class CreatePrivmessages < ActiveRecord::Migration[6.0]
  def change
    create_table :privmessages do |t|
      t.text :mestext
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :pchat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
