class CreateBucketLists < ActiveRecord::Migration[5.1]
  def change
    create_table :bucket_lists do |t|

      t.timestamps
    end
  end
end
