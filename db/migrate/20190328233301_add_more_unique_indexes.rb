class AddMoreUniqueIndexes < ActiveRecord::Migration[5.1]
  def change
    
    change_column :valid_times, :venue_id, :bigint
    
    change_column :valid_dates, :competition_id, :bigint
  end
end
