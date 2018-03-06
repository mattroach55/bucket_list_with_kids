class CreateAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :entity
      t.boolean :show
      t.string :description
      t.string :street_number
      t.string :street
      t.string :locality
      t.string :country
      t.string :region
      t.float :latitude
      t.float :longitude
      t.string :photo
      t.string :holiday_type
      t.string :theme
      t.integer :kids_age_from
      t.integer :kids_age_to
      t.integer :duration
      t.float :price
      t.boolean :kids_club
      t.boolean :kids_menu
      t.boolean :connecting_rooms
      t.boolean :pool
      t.boolean :beach
      t.integer :bucket_list_count
      t.integer :average_review_score
      t.string :booking_link

      t.references :destination, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
