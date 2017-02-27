class AddWinnerToNominations < ActiveRecord::Migration[5.0]
  def change
    add_column :nominations, :winner, :boolean, default: false
  end
end
