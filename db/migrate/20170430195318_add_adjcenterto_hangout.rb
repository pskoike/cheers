class AddAdjcentertoHangout < ActiveRecord::Migration[5.0]
  def change
    add_column :hangouts, :adj_latitude, :float
    add_column :hangouts, :adj_longitude, :float
  end
end
