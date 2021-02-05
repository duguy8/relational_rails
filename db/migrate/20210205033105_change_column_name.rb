class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :dealers, :monthly_gross, :sq_ft
  end
end
