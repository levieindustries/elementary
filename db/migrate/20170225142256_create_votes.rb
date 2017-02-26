class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.references :nomination, foreign_key: true, null: false
      t.references :ballot, foreign_key: true, null: false
      t.integer :year, null: false

      t.timestamps
    end
  end
end
