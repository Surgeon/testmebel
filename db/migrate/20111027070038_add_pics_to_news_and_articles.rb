class AddPicsToNewsAndArticles < ActiveRecord::Migration
  def up
    add_column :news_items, :image_link, :string
    add_column :articles, :image_link, :string
  end

  def down
    remove_column :news_items, :image_link
    remove_column :articles, :image_link
  end
end
