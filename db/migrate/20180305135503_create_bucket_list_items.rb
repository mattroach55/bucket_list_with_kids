class CreateBucketListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bucket_list_items do |t|

    t.references :accommodation, foreign_key: true
    t.references :experience, foreign_key: true
    t.references :user, foreign_key: true
    t.references :destination, foreign_key: true

    t.timestamps
    end
  end
end
