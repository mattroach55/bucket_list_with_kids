class Review < ApplicationRecord
  belongs_to :accommodation
  belongs_to :experience
  belongs_to :user, through: :experience
  belongs_to :user, through: :accommodation
end
