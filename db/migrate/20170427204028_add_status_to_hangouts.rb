class AddStatusToHangouts < ActiveRecord::Migration[5.0]
  def change
    add_column :hangouts, :status, :string
  end
end
