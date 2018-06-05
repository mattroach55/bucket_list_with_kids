class Destination < ApplicationRecord
  has_many :accommodations
  has_many :experiences
  # has_many :bucket_list_items
  belongs_to :user
  validates :name, presence: true
  # validates :show, default: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

  # mount_uploader :photo, PhotoUploader

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?

  # make sure the default
  before_validation :set_entity

  acts_as_votable

# CODE FOR PG MUlTISEARCH
  include PgSearch
  multisearchable against: [ :name, :description, :locality, :country, :region, :holiday_type, :theme ]
# CODE FOR PG MUlTISEARCH

  paginates_per 16

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end

  private
  def set_entity
    self.entity ||= 'destination'
  end
end
