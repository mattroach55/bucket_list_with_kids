class AddKidsAgesToEntities < ActiveRecord::Migration[5.1]
  def change
    add_column :destinations, :allowed_age_0_4, :boolean
    add_column :experiences, :allowed_age_0_4, :boolean
    add_column :accommodations, :allowed_age_0_4, :boolean
    add_column :destinations, :allowed_age_5_7, :boolean
    add_column :experiences, :allowed_age_5_7, :boolean
    add_column :accommodations, :allowed_age_5_7, :boolean
    add_column :destinations, :allowed_age_8_11, :boolean
    add_column :experiences, :allowed_age_8_11, :boolean
    add_column :accommodations, :allowed_age_8_11, :boolean
    rename_column :destinations, :kids_age_from, :allowed_age_12_15
    rename_column :accommodations, :kids_age_from, :allowed_age_12_15
    rename_column :experiences, :kids_age_from, :allowed_age_12_15
    rename_column :destinations, :kids_age_to, :allowed_age_16_18
    rename_column :accommodations, :kids_age_to, :allowed_age_16_18
    rename_column :experiences, :kids_age_to, :allowed_age_16_18
  end
end
