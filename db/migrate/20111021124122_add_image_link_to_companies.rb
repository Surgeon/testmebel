class AddImageLinkToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :image_link, :string
  end

  def down
    remove_column :companies, :image_link
  end
end
