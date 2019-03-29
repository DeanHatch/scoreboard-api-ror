class CreateBcadvancements < ActiveRecord::Migration[5.1]
  def change
    create_table :bcadvancements do |t|
      t.integer :from_contest_id
      t.string :wl

      t.timestamps
    end
  end
end
