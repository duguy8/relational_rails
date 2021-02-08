class CreateTeacher < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.string :name
      t.integer :school_id
      t.string :name
      t.boolean :college_graduate
      t.integer :salary

      t.timestamps
    end
  end
end
