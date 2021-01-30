class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.text :report_text
      t.string :rep_user_id
      t.belongs_to :post, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :reports, :rep_user_id
  end
end
