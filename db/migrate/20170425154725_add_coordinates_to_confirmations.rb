class AddCoordinatesToConfirmations < ActiveRecord::Migration[5.0]
  def change
    add_column :confirmations, :latitude, :float
    add_column :confirmations, :longitude, :float
  end
end
