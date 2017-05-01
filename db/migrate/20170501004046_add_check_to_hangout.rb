class AddCheckToHangout < ActiveRecord::Migration[5.0]
  def change
    add_column :hangouts, :force_location, :boolean, default: false
  end
end
