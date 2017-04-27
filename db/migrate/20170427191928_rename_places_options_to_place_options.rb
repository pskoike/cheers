class RenamePlacesOptionsToPlaceOptions < ActiveRecord::Migration[5.0]
  def change
    rename_table :places_options, :place_options
  end
end
