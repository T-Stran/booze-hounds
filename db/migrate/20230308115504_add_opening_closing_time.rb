class AddOpeningClosingTime < ActiveRecord::Migration[7.0]
  def change
    add_column :pubs, :opening_time, :integer
    add_column :pubs, :closing_time, :integer
  end
end
