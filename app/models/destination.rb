class Destination < ApplicationRecord
  has_many :accommodations
  has_many :experiences
  belongs_to :user
  has_many :bucket_lists
end
