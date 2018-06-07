class NamedRoutes < ActiveRecord::Migration[5.1]
  def up
    add_column :destinations, :url_name, :string
    add_column :experiences, :url_name, :string

    add_index :destinations, :url_name
    add_index :experiences, :url_name

    add_column :destinations, :meta_title, :string
    add_column :destinations, :meta_description, :string
    add_column :destinations, :page_title, :string
    add_column :experiences, :meta_title, :string
    add_column :experiences, :meta_description, :string
    add_column :experiences, :page_title, :string

    [Destination, Experience].each do |k|
      k.all.each do |d|
        d.update! url_name: d.name.parameterize
      end
    end
  end

  def down
    remove_column :destinations, :url_name
    remove_column :experiences, :url_name
    remove_column :destinations, :meta_title, :string
    remove_column :destinations, :meta_description, :string
    remove_column :destinations, :page_title, :string
    remove_column :experiences, :meta_title, :string
    remove_column :experiences, :meta_description, :string
    remove_column :experiences, :page_title, :string
  end
end
