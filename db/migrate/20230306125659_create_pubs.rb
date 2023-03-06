class CreatePubs < ActiveRecord::Migration[7.0]
  def change
    create_table :pubs do |t|
      t.string :name
      t.string :address
      t.text :description
      t.date :opening_time
      t.date :closing_time
      t.string :website
      t.integer :phone_number
      t.boolean :pool_table
      t.boolean :non_alcoholic_drinks_selection
      t.boolean :garden
      t.boolean :parking
      t.boolean :live_sport
      t.boolean :wheelchair_accessible
      t.boolean :food_menu

      t.timestamps
    end
  end
end
