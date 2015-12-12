class AddReadTimeToMessage < ActiveRecord::Migration
  def change
    add_column :messages, :read_time, :datetime
  end
end
