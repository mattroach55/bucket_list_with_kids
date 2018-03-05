class CreateAccommodations < ActiveRecord::Migration[5.1]
  def change
    create_table :accommodations do |t|
      t.string :name
      t.string :description
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :photo
      t.boolean :kids_club
      t.boolean :kids_menu
      t.boolean :pool
      t.boolean :beach
      t.boolean :connecting_rooms
      t.integer :average_review_score
      t.integer :bucket_list_count

      t.timestamps
    end
  end
end
