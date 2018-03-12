class Destination < ApplicationRecord
  has_many :accommodations
  has_many :experiences
  # has_many :bucket_list_items
  belongs_to :user
  validates :name, presence: true
  # validates :show, default: true
  mount_uploader :photo, PhotoUploader

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?

  acts_as_votable

# CODE FOR PG MUlTISEARCH
  include PgSearch
  multisearchable against: [ :name, :description, :locality, :country, :region, :holiday_type, :theme ]
# CODE FOR PG MUlTISEARCH

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end


  include AlgoliaSearch
  algoliasearch index_name: 'dev_BUCKETKIDS', id: :algolia_id do
    attributes :name, :entity, :description, :street, :locality, :region,
    :country, :holiday_type, :theme, :bucket_list_count, :average_review_score,
    :kids_age_from, :photo, :kids_age_to, :connecting_rooms, :price, :pool, :beach,
    :show, :duration

    searchableAttributes ['name', 'entity', 'unordered(description)']

    customRanking ['desc(bucket_list_count)']
  end

  # index.search({
  # filters: '(category:Book OR category:Ebook) AND author:"JK Rowling"'
  # });


  private

  def algolia_id
    "#{id}" # ensure the teacher & student IDs are not conflicting
  end

end
