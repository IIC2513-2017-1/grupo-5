class EditIDsOnTables < ActiveRecord::Migration[5.0]
  def change
    #rename_column :bets, :user, :user_id
    rename_column :bets, :match, :match_id
    #rename_column :events, :gestor, :user_id
    remove_column :bets, :user
    remove_column :events, :gestor
    add_reference :bets, :user, foreign_key: true
    add_reference :events, :user, foreign_key: true
  end
end
