class Experience < ApplicationRecord
  has_many :reviews
  belongs_to :user, optional: true
  belongs_to :destination
  validates :name, presence: true
  validates :description, presence: true
  # validates :show, default: true
  mount_uploader :photo, PhotoUploader

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?
# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE

# CODE FOR VOTE FUNCTION
  acts_as_votable

# CODE FOR PG MUlTISEARCH
  include PgSearch
  multisearchable against: [ :name, :description, :locality, :country, :region, :holiday_type, :theme ]
# CODE FOR PG MUlTISEARCH

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end
end
