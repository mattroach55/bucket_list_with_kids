class AddReferencesDestinationsUser < ActiveRecord::Migration[5.1]
  def change
    add_reference :destinations, :user, foreign_key: true
  end
end
