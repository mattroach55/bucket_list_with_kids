class AddDestinationToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :accommodations, :destination, :string
    add_column :experiences, :destination, :string
  end
end
