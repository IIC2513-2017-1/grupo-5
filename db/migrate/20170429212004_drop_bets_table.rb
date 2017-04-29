class DropBetsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :bets
  end
end
