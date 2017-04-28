class CreateBetsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :bets do |t|
      t.integer :user
      t.integer :ammount
      t.integer :state
      t.integer :match

      t.timestamps
    end
  end
end
