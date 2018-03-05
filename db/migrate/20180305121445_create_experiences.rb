class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :photo
      t.integer :duration
      t.integer :bucket_list_count
      t.integer :average_review_score
      t.integer :theme
      t.integer :kids_age_from
      t.integer :kids_age_to
      t.float :price

      t.timestamps
    end
  end
end
