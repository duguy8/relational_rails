class CreateDealer < ActiveRecord::Migration[5.2]
  def change
    create_table :dealers do |t|
      t.string :name
      t.boolean :fully_staffed
      t.integer :monthly_gross
      t.string :city

      t.timestamps
    end
  end
end
