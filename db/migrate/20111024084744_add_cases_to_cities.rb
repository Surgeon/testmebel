class AddCasesToCities < ActiveRecord::Migration
  def up
    add_column :cities, :rod_case, :string
    add_column :cities, :pred_case, :string
  end

  def down
    remove_column :cities, :rod_case
    remove_column :cities, :pred_case
  end
end
