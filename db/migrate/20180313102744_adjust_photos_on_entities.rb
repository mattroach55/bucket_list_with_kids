class AdjustPhotosOnEntities < ActiveRecord::Migration[5.1]
  def change
    remove_column :destinations, :photo1, :string
    remove_column :accommodations, :photo1, :string
    remove_column :experiences, :photo1, :string
    remove_column :destinations, :photo2, :string
    remove_column :accommodations, :photo2, :string
    remove_column :experiences, :photo2, :string
    remove_column :destinations, :photo3, :string
    remove_column :accommodations, :photo3, :string
    remove_column :experiences, :photo3, :string
    remove_column :destinations, :photo4, :string
    remove_column :accommodations, :photo4, :string
    remove_column :experiences, :photo4, :string
    add_column :destinations, :photos, :string
    add_column :accommodations, :photos, :string
    add_column :experiences, :photos, :string
  end
end
