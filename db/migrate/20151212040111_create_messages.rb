class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :content
      t.boolean :unread
      t.datetime :read_time
      t.text :images
      t.belongs_to :user, :foreign_key => 'sender', index: true

      t.timestamps null: false
    end
  end
end
