class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
    create_table :instruments do |t|
      t.string :category
      t.decimal :day_value
      t.string :brand
      t.text :description
      t.string :condition
      t.string :photo
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
