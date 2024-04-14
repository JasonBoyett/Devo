class Devotional < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :impressions
end
