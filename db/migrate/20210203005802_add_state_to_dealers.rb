class AddStateToDealers < ActiveRecord::Migration[5.2]
  def change
    add_column :dealers, :state, :string
  end
end
