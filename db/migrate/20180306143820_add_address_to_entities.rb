class AddAddressToEntities < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :address, :string
    add_column :experiences, :address, :string
    add_column :accommodations, :address, :string
  end
end
