class User < ActiveRecord::Base
    has_and_belongs_to_many :messages
    has_many :sent_messages, foreign_key: :sender_id, class_name: 'Message'
    has_and_belongs_to_many :friends,
      class_name: 'User',
      foreign_key: 'user_id',
      association_foreign_key: 'friend_id',
      join_table: 'friendships'

    has_secure_password

    validates :name, :presence => true
    validates :email, :presence => true, uniqueness: true
    validates :password, :presence => true
    validates :password_confirmation, :presence => true

    def recomend_friend_list
        ids = self.friends.map {|friend| friend.id }
        ids << self.id

        User.where.not(id: ids)
    end

    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
        user.provider = auth.provider
        user.email = auth.uid
        user.name = auth.info.name
        user.oauth_token = auth.credentials.token
        user.oauth_expires_at = Time.at(auth.credentials.expires_at)
        user.save!
      end
    end
end
