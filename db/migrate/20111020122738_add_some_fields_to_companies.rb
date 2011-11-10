class AddSomeFieldsToCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :url, :string
    add_column :companies, :email, :string
  end

  def down
    remove_column :companies, :url
    remove_column :companies, :email
  end
end
