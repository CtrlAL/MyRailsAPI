class RemoveForeignKey < ActiveRecord::Migration
  def change
    # remove the old foreign_key
    remove_foreign_key :posts, :users
  end
end
