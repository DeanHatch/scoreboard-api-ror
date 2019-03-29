class CreateAlertRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :alert_requests do |t|
      t.string :type
      t.string :to_dest
      t.string :at_domain
      t.integer :team_id

      t.timestamps
    end
  end
end
