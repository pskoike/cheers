class AddTimetoConfirmation < ActiveRecord::Migration[5.0]
  def change
    add_column :confirmations, :time_to_place, :integer
    add_column :confirmations, :distance_to_place, :integer
  end
end
