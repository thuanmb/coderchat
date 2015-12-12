class AddMoreTable < ActiveRecord::Migration
  def change
    create_table :friendships, id: false do |t|
      t.belongs_to :user
      t.belongs_to :friend
    end
  end
end
