class CreateContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :contestants do |t|
      t.integer :competition_id
      t.string :type
      t.integer :contest_id
      t.string :contest_type
      t.string :homeaway
      t.integer :team_id
      t.integer :score
      t.boolean :forfeit
      t.integer :seeding
      t.integer :bracketgrouping_id
      t.string :bcspec_type
      t.integer :bcspec_id

      t.timestamps
    end
  end
end
