class RefactorMillionFromCitiesToInteger < ActiveRecord::Migration
  def up
    change_column :cities, :million, :integer
  end

  def down
    change_column :cities, :million, :boolean
  end
end
