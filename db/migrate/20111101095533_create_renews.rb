class CreateRenews < ActiveRecord::Migration
  def change
    create_table :renews do |t|

      t.string :name
      t.string :address
      t.string :website
      t.text :description
      t.string :email
      t.timestamps
    end
  end
end
