class Experience < ApplicationRecord
  before_validation :set_url_name

  def to_param
    url_name
  end

  has_many :reviews
  has_many :accommodations
  belongs_to :user, optional: true
  belongs_to :destination
  has_many :photos, dependent: :destroy
  # mount_uploader :photo, PhotoUploader

  validates :url_name, presence: true

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?
# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE

# CODE FOR VOTE FUNCTION
  acts_as_votable

# CODE FOR PG MUlTISEARCH
  include PgSearch
  multisearchable against: [ :name, :destination_name, :description, :locality, :country, :region, :holiday_type, :theme ]
# CODE FOR PG MUlTISEARCH

  paginates_per 16

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end
  
  private
  def set_url_name
    self.url_name ||= name.parameterize
  end
end
