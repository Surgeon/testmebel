class ChangeStaticBodyToText < ActiveRecord::Migration
  def change
    change_column :static_pages, :body, :text
  end

end
