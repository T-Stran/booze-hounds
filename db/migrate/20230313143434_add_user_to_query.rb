class AddUserToQuery < ActiveRecord::Migration[7.0]
  def change
    add_reference :queries, :user
  end
end
