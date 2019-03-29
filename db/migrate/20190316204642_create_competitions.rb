class CreateCompetitions < ActiveRecord::Migration[5.1]
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :sport
      t.integer :variety
      t.boolean :poolgroupseason
      t.string :poolgroupseasonlabel
      t.boolean :playoffbracket
      t.string :playoffbracketlabel
      t.boolean :keepscores
      t.integer :winpoints
      t.integer :drawpoints
      t.integer :losspoints
      t.integer :forfeitpoints
      t.integer :forfeitwinscore
      t.integer :forfeitlossscore
      t.integer :organization_id
      t.string :hashed_manager_password
      t.string :hashed_scorer_password
      t.string :salt

      t.timestamps
    end
  end
end
