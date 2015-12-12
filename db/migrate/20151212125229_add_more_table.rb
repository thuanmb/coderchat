class AddMoreTable < ActiveRecord::Migration
  def change
    remove_column :users, :friend_id

    create_table :friendships, id: false do |t|
      t.belongs_to :user
      t.belongs_to :friend
    end
  end
end
