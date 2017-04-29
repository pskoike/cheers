class AddFsqCatIdToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :fsq_cat_id, :string
  end
end
