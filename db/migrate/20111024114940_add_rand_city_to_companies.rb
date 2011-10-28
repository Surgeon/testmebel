class AddRandCityToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :rand_city, :integer
  end

  def down
    remove_column :companies, :rand_city
  end
end
