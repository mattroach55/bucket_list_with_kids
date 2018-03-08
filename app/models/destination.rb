class Destination < ApplicationRecord
  has_many :accommodations
  has_many :experiences
  belongs_to :user
  validates :name, presence: true
  # validates :show, default: true
  mount_uploader :photo, PhotoUploader

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?

  acts_as_votable

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end

  def algolia_id
    "destination_#{id}" # ensure the teacher & student IDs are not conflicting
  end

  include AlgoliaSearch
  algoliasearch index_name: 'dev_BUCKETKIDS' do
    attributes :name, :entity, :description, :street, :locality, :region,
    :country, :holiday_type, :theme, :bucket_list_count, :average_review_score

    searchableAttributes ['name', 'entity', 'unordered(description)']

    customRanking ['desc(bucket_list_count)']
  end
end
