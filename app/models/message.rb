class Message < ActiveRecord::Base
  belongs_to :sender, foreign_key: :sender_id, class_name: 'User'
  has_and_belongs_to_many :users
  paginates_per 5

  mount_uploaders :images, MessageImageUploader
end
