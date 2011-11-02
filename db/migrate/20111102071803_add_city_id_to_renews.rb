class AddCityIdToRenews < ActiveRecord::Migration
  def up
    add_column :renews, :city_id, :integer
    add_column :renews, :user_message, :text
  end

  def down
    remove_column :renews, :city_id
    remove_column :renews, :user_message
  end
end
