class AddImagesIntoMessages < ActiveRecord::Migration
  def change
	add_column :messages, :images, :text
  end
end
