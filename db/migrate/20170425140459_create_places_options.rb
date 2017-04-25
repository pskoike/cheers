class CreatePlacesOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :places_options do |t|
      t.references :hangout, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
