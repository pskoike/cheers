class AddRadiusToHangout < ActiveRecord::Migration[5.0]
  def change
    add_column :hangouts, :radius, :integer
  end
end
