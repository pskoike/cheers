class AddCoordinatesToHangouts < ActiveRecord::Migration[5.0]
  def change
    add_column :hangouts, :latitude, :float
    add_column :hangouts, :longitude, :float
  end
end
