class AddIfMillionToCities < ActiveRecord::Migration
  def up
    add_column :cities, :million, :boolean
  end

  def down
    remove_column :cities, :million
  end
end
