class CreateNominations < ActiveRecord::Migration[5.0]
  def change
    create_table :nominations do |t|
      t.references :nominee, foreign_key: { to_table: :films }
      t.references :category, foreign_key: true
      t.integer :year, null: false

      t.timestamps
    end
  end
end
