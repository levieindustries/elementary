class CreateFilms < ActiveRecord::Migration[5.0]
  def change
    create_table :films do |t|
      t.string :name, null: false
      t.string :description
      t.integer :year, null: false

      t.timestamps
    end
  end
end
