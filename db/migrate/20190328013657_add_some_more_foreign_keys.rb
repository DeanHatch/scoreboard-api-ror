class AddSomeMoreForeignKeys < ActiveRecord::Migration[5.1]
  def change
    change_column :contests, :awaycontestant_id, :bigint
    add_foreign_key :contests, :contestants, column: :awaycontestant_id
    
    change_column :contests, :bracketgrouping_id, :bigint
    add_foreign_key :contests, :groupings, column: :bracketgrouping_id
    
    change_column :venues, :competition_id, :bigint
    add_foreign_key :venues, :competitions
  end
end
