class CreateInstrument < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name
      t.boolean :on_sale
      t.string :brand
      t.integer :dealer_id
      t.integer :price

      t.timestamps
    end
  end
end
