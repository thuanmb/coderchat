class CreateNewTableForMessageUser < ActiveRecord::Migration
  def change
    create_table :messages_users, id: false do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :message, index: true, foreign_key: true
    end
  end
end
