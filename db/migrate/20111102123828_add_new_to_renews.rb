class AddNewToRenews < ActiveRecord::Migration
  def up
    add_column :renews, :new, :integer
  end

  def down
    remove_column :renews, :new
  end
end
