class BucketListItem < ApplicationRecord
  belongs_to :accommodation, optional: true
  belongs_to :experience, optional: true
  belongs_to :destination
  belongs_to :user
end
