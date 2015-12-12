class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :unread
      t.references :sender, index: true, foreign_key: true
      t.references :recipient, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
