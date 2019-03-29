class CreateValiddates < ActiveRecord::Migration[5.1]
  def change
    create_table :validdates do |t|
      t.date :gamedate
      t.integer :competition_id

      t.timestamps
    end
  end
end
