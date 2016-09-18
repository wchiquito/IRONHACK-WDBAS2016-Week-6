class CreateRegistrations < ActiveRecord::Migration[5.0]
  def change
    create_table :registrations do |t|
      t.references :tournament, foreign_key: true
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
