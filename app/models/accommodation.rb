class Accommodation < ApplicationRecord
  has_many :reviews
  belongs_to :user, optional: true
  belongs_to :destination
  mount_uploader :photo, PhotoUploader

  # TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_validation :geocode, if: :will_save_change_to_street?

  def full_address
    "#{street} #{street_number}, #{locality}, #{country}, #{region}"
  end

  include AlgoliaSearch
  algoliasearch do
    attributes :name, :entity, :description, :street, :locality, :region,
    :country, :holiday_type, :theme, :bucket_list_count, :average_review_score

    searchableAttributes ['name', 'entity', 'unordered(description)']

    customRanking ['desc(bucket_list_count)']
  end
end
