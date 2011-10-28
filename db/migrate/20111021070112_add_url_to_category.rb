class AddUrlToCategory < ActiveRecord::Migration
  def up
    add_column :categories, :url, :string
  end

  def down
    remove_column :categories, :url
  end
end
