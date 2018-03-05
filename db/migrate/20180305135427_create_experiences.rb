class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :description
      t.string :street_number
      t.string :address
      t.string :locality
      t.string :country
      t.string :region
      t.float :latitude
      t.float :longitude
      t.string :photo
      t.string :type
      t.string :holiday_type
      t.string :theme
      t.integer :kids_age_from
      t.integer :kids_age_to
      t.integer :duration
      t.float :price
      t.integer :bucket_list_count
      t.integer :average_review_score

      t.timestamps
    end
  end
end
