class CreateXlinks < ActiveRecord::Migration
  def change
    create_table :xlinks do |t|

      t.string :keyword
      t.integer :case
      t.timestamps
    end
  end
end
