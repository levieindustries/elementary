class SorceryCore < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
    add_column :users, :crypted_password, :string
    add_column :users, :salt, :string
  end
end
