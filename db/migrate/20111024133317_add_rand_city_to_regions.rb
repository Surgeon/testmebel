class AddRandCityToRegions < ActiveRecord::Migration
  def up
    add_column :regions, :rand_city, :integer
  end

  def down
    remove_column :regions, :rand_city
  end
end
