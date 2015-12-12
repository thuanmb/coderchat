class CreateNewTableForMessageUser < ActiveRecord::Migration
  def change
    create_table :messages_users, id: false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :message, index: true, foreign_key: true
    end
  end
end
