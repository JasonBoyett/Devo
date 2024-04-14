class Comment < ApplicationRecord
  belongs_to :devotional
  belongs_to :user
  has_many :comment_impressions
end
