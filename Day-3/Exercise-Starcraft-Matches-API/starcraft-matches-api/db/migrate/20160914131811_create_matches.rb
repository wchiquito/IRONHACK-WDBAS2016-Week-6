class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.string :winner_faction
      t.string :loser_faction
      t.integer :duration
      t.datetime :date
      t.references :winner, foreign_key: true
      t.references :loser, foreign_key: true

      t.timestamps
    end
  end
end
