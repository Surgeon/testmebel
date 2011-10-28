class AddFriendlyUrlToCitiesAndRegions < ActiveRecord::Migration
  def up
    add_column :regions, :friendly_url, :string
    add_column :cities, :friendly_url, :string
  end

  def down
    remove_column :regions, :friendly_url
    remove_column :cities, :friendly_url
  end
end
