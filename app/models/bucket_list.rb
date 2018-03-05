class BucketList < ApplicationRecord
  belongs_to :user
  has_many :experiences
  has_many :accommodations
  has_many :destinations
end
