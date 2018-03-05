class BucketListItem < ApplicationRecord
  belongs_to :accommodation
  belongs_to :experience
  belongs_to :destination
  belongs_to :user
end
