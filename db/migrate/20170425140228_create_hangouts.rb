class CreateHangouts < ActiveRecord::Migration[5.0]
  def change
    create_table :hangouts do |t|
      t.string :title
      t.datetime :date
      t.string :category
      t.string :center_address
      # t.references :user, foreign_key: true
      # t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
