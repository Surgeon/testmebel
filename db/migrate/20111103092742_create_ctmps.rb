class CreateCtmps < ActiveRecord::Migration
  def change
    create_table :ctmps do |t|

      t.string :name
      t.string :friendly_url
      t.string :pred_case
      t.string :rod_case
      t.integer :region_id
      t.string :zip
      t.integer :million
    end
  end
end
