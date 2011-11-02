class CreateRcategories < ActiveRecord::Migration
  def up
    create_table :categories_renews, :id => false do |t|
    t.references :renew
    t.references :category
    end
  end

  def down
    drop_table :categories_renews
  end
end
