class AddColumnBets < ActiveRecord::Migration[5.0]
  def change
    add_reference :bets, :team, foreign_key: true
  end
end
