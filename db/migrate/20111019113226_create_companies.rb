class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|

      t.string :name
      t.string :address
      t.string :website
      t.text :description
      t.integer :city_id
      t.integer :category_id
      t.timestamps
    end
  end
end
