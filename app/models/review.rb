class Review < ApplicationRecord
  belongs_to :accommodation, optional: true
  belongs_to :experience, optional: true
  belongs_to :user

  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :description, presence: true, allow_blank: false
end
