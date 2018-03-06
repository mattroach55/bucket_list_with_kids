class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :description
      t.integer :rating

      t.references :accommodation, foreign_key: true
      t.references :experience, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
