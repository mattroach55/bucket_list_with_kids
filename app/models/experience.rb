class Experience < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :destination
end
