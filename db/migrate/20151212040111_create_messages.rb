class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :unread
      t.datetime :read_time
      t.text :images
      t.belongs_to :sender, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
