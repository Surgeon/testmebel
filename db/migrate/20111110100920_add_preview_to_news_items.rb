class AddPreviewToNewsItems < ActiveRecord::Migration
  def up
    add_column :news_items, :preview, :text
  end

  def down
    remove_column :news_items, :preview
  end
end
