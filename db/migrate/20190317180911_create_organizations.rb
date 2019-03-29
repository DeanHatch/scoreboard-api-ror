class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :phone
      t.string :website
      t.integer :customer_id

      t.timestamps
    end
  end
end
