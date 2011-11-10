class AddRodCaseToRegions < ActiveRecord::Migration
  def up
    add_column :regions, :rod_case, :string
  end

  def down
    remove_column :regions, :rod_case
  end
end
