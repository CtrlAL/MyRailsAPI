class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.decimal :longitude
      t.decimal :latetude
      t.string :uuid
      t.string :token

      t.timestamps
    end
  end
end
