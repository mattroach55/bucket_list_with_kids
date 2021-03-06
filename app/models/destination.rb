class Destination < ApplicationRecord
  before_validation :set_url_name

  has_many :accommodations
  has_many :experiences
  # has_many :bucket_list_items
  belongs_to :user
  validates :name, presence: true
  validates :url_name, presence: true

  # validates :show, default: true
  has_many :photos, dependent: :destroy
  accepts_nested_attributes_for :photos, allow_destroy: true

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

  def headline
    description.split(".", 2).first + "."
  end

  def to_param
    url_name
  end

  private
  def set_entity
    self.entity ||= 'destination'
  end

  def set_url_name
    self.url_name ||= name.parameterize
  end
end
