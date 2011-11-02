class CreateRphones < ActiveRecord::Migration
  def change
    create_table :rphones do |t|

      t.string :number
      t.string :type
      t.timestamps
    end
  end
end
