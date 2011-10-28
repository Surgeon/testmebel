class CreateCompaniesCategories < ActiveRecord::Migration
  def up
    create_table :categories_companies, :id => false do |t|
    t.references :company
    t.references :category
    end
  end

  def down
    drop_table :categories_companies
  end
end
