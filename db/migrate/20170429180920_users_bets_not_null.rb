class UsersBetsNotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :bets, :user, false
    change_column_null :bets, :ammount, false
    change_column_null :bets, :state, false
    change_column_null :bets, :match, false
    change_column_null :users, :email, false
    change_column_null :users, :password, false
    change_column_null :users, :coins, false
    change_column_null :users, :role, false
  end
end
