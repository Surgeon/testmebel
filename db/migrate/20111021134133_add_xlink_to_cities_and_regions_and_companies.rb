class AddXlinkToCitiesAndRegionsAndCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :xlink, :integer
    add_column :cities, :xlink, :integer
    add_column :regions, :xlink, :integer
  end

  def down
    remove_column :companies, :xlink
    remove_column :cities, :xlink
    remove_column :regions, :xlink
  end
end
