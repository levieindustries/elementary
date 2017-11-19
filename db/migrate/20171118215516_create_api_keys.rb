class CreateApiKeys < ActiveRecord::Migration[5.1]
  def change
    create_table :api_keys do |t|
      t.references :keyable, polymorphic: true, null: false
      t.string :token, null: false
      t.index :token, unique: true

      t.timestamps
      t.datetime :deleted_at
    end
  end
end
