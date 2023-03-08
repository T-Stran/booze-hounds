class AddPostcode < ActiveRecord::Migration[7.0]
  def change
    add_column :pubs, :postcode, :string
  end
end
