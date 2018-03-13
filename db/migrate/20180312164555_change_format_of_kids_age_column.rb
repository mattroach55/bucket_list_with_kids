class ChangeFormatOfKidsAgeColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :destinations, :allowed_age_12_15
    remove_column :accommodations, :allowed_age_12_15
    remove_column :experiences, :allowed_age_12_15
    remove_column :destinations, :allowed_age_16_18
    remove_column :accommodations, :allowed_age_16_18
    remove_column :experiences, :allowed_age_16_18
    add_column :destinations, :allowed_age_12_15, :boolean
    add_column :accommodations, :allowed_age_12_15, :boolean
    add_column :experiences, :allowed_age_12_15, :boolean
    add_column :destinations, :allowed_age_16_18, :boolean
    add_column :accommodations, :allowed_age_16_18, :boolean
    add_column :experiences, :allowed_age_16_18, :boolean
  end
end
