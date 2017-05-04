class ChangeForceLocationToHangouts < ActiveRecord::Migration[5.0]
  def change
    add_column :hangouts, :optimize_location, :boolean, default: true
    remove_column :hangouts, :force_location
  end
end
