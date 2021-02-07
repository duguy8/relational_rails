class CreateSchool < ActiveRecord::Migration[5.2]
  def change
    create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.boolean :gradeschool

      t.timestamps
    end
  end
end
