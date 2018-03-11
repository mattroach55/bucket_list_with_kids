class Photo < ApplicationRecord
  belongs_to :accommodation
  belongs_to :experience
  belongs_to :destination
end
