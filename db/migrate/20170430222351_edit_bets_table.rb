class EditBetsTable < ActiveRecord::Migration[5.0]
  def change
    change_column_null :bets, :ammount, false
    change_column_null :bets, :bet_state, false
  end
end
