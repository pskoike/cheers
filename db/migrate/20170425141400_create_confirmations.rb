class CreateConfirmations < ActiveRecord::Migration[5.0]
  def change
    create_table :confirmations do |t|
      t.string :leaving_address
      t.string :transportation
      t.references :user, foreign_key: true
      t.references :hangout, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
