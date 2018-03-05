class CreateBucketListItems < ActiveRecord::Migration[5.1]
  def change
    create_table :bucket_list_items do |t|

      t.timestamps
    end
  end
end
