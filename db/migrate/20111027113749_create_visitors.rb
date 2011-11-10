class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|

      t.string :name
      t.string :phone
      t.string :email
      t.text :message
      t.integer :company_id
      t.timestamps
    end
  end
end
