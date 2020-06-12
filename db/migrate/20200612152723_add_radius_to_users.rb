class AddRadiusToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :radius, :Fixnum
    add_index :users, :radius
  end
end
