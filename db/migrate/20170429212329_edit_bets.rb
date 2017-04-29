class EditBets < ActiveRecord::Migration[5.0]
  def change
    change_column_null :bets, :ammount, false
    change_column_null :bets, :bet_state, false
    add_reference :bets, :match, foreign_key: true
    add_reference :bets, :user, foreign_key: true
  end
end
