class Experience < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :destination
  validates :name, presence: true
  validates :description, presence: true
  # validates :show, default: true
  mount_uploader :photo, PhotoUploader

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end

end
