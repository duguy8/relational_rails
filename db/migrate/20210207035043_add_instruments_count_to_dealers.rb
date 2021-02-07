class AddInstrumentsCountToDealers < ActiveRecord::Migration[5.2]
  def change
    add_column :dealers, :instruments_count, :integer
  end
end
