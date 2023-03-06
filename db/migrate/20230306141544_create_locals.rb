class CreateLocals < ActiveRecord::Migration[7.0]
  def change
    create_table :locals do |t|
      t.references :pub, null: false, foreign_key: true
      t.references :dog, null: false, foreign_key: true

      t.timestamps
    end
  end
end
