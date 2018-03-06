class Destination < ApplicationRecord
  has_many :accommodations
  has_many :experiences
<<<<<<< HEAD
  belongs_to :user
=======
  # belongs_to :user

>>>>>>> master
  mount_uploader :photo, PhotoUploader

# TO GET GEOCODE WHERE ADDRESS THAT IT BROKEN UP INTO SEPARATE COLUMNS IN THE TABLE
  geocoded_by :full_address
  after_create :geocode, if: :will_save_change_to_address?

  def full_address
    "#{street} #{number}, #{locality}, #{country}, #{region}"
  end

end
