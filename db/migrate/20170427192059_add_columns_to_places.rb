class AddColumnsToPlaces < ActiveRecord::Migration[5.0]
  def change
    add_column :places, :photo_url, :string
    add_column :places, :rating, :float
    add_column :places, :category, :string
    add_column :places, :fsq_url, :string
    add_column :places, :fsq_id, :string
  end
end
