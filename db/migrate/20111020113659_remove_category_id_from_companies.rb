class RemoveCategoryIdFromCompanies < ActiveRecord::Migration
  def up
    remove_column :companies, :category_id
  end

  def down
    add_column :companies, :category_id, :integer
  end
end
