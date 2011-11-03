class AddCompanyIdToRenews < ActiveRecord::Migration
  def up
    add_column :renews, :company_id, :integer
  end

  def down
    remove_column :renews, :company_id
  end
end
