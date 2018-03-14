class AddDestinationToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :accommodations, :destination_name, :string
    add_column :experiences, :destination_name, :string
  end
end
