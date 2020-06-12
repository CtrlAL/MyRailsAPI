class AddChatkeyToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :chatkey, :string
    add_index :posts, :chatkey
  end
end
