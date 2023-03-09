class AddDetailsToFavourites < ActiveRecord::Migration[7.0]
  def change
    add_reference :favourites, :user, null: false, foreign_key: true
    add_reference :favourites, :pub, null: false, foreign_key: true
  end
end
