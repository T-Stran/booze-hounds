class AddDetailsToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :pub, null: false, foreign_key: true
  end
end
