class CreatePchats < ActiveRecord::Migration[6.0]
  def change
    create_table :pchats do |t|
      t.string :adress_user

      t.timestamps
    end
  end
end
