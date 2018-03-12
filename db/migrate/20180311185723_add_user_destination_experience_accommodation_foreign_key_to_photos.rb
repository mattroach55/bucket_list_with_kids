class AddUserDestinationExperienceAccommodationForeignKeyToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :user, foreign_key: true
    add_reference :photos, :destination, foreign_key: true
    add_reference :photos, :experience, foreign_key: true
    add_reference :photos, :accommodation, foreign_key: true
  end
end
