class AddRandCityToCities < ActiveRecord::Migration
  def up
    add_column :cities, :rand_city, :integer
  end

  def down
    remove_column :cities, :rand_city
  end
end
