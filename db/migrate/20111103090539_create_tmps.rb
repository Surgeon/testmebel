class CreateTmps < ActiveRecord::Migration
  def change
    create_table :tmps do |t|

      t.string :name
      t.string :rod_case
      t.string :pred_case
      t.string :friendly_url
      t.string :fed_destrict
    end
  end
end
