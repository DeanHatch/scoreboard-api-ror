class CreateGroupings < ActiveRecord::Migration[5.1]
  def change
    create_table :groupings do |t|
      t.integer :competition_id
      t.string :name
      t.integer :parent_id
      t.boolean :bracket_grouping

      t.timestamps
    end
  end
end
