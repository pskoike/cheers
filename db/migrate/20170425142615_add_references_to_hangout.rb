class AddReferencesToHangout < ActiveRecord::Migration[5.0]
  def change
    add_reference :hangouts, :user, foreign_key: true
    add_reference :hangouts, :place, foreign_key: true
  end
end
