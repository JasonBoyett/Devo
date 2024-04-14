class User < ApplicationRecord
  has_secure_password
  has_many :follows, foreign_key: 'follower_id'
  has_many :followed_users, through: :follows, source: :followed
end
