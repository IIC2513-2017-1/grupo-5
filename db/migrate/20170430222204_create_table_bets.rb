class CreateTableBets < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.integer :ammount
      t.integer :bet_state

      t.timestamps
    end
  end
end
