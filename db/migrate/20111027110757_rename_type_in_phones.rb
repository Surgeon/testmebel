class RenameTypeInPhones < ActiveRecord::Migration
  def up
    rename_column :phones, :type, :phone_type
  end

  def down

  end
end
