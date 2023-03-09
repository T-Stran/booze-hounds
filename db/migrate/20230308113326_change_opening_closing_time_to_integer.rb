class ChangeOpeningClosingTimeToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :pubs, :opening_time
    remove_column :pubs, :closing_time
  end
end
