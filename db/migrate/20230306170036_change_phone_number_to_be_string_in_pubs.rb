class ChangePhoneNumberToBeStringInPubs < ActiveRecord::Migration[7.0]
  def change
    change_column :pubs, :phone_number, :string
  end
end
