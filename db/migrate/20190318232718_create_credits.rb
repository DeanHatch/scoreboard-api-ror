class CreateCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :credits do |t|
      t.string :type
      t.integer :customer_id

      t.timestamps
    end
  end
end
