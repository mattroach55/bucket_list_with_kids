class RemoveAddressFromEntities < ActiveRecord::Migration[5.1]
  def change
    remove_column :destinations, :address
    remove_column :experiences, :address
    remove_column :accommodations, :address
  end
end
