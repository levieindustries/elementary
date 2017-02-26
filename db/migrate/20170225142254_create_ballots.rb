class CreateBallots < ActiveRecord::Migration[5.0]
  def change
    create_table :ballots do |t|
      t.references :user, foreign_key: true
      t.integer :year, null: false

      t.timestamps
    end
  end
end
