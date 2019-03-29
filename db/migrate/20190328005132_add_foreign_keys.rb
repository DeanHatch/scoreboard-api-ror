class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    change_column :competitions, :organization_id, :bigint
    add_foreign_key :competitions, :organizations
    change_column :groupings, :competition_id, :bigint
    add_foreign_key :groupings, :competitions
    change_column :teams, :grouping_id, :bigint
    add_foreign_key :teams, :groupings
    change_column :contests, :venue_id, :bigint
    add_foreign_key :contests, :venues
  end
end
