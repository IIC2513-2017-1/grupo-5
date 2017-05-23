class DropPlayers < ActiveRecord::Migration[5.0]
  def change
    remove_foreign_key :participations, :players
    remove_column :participations, :player_id
    drop_table :players
  end
end
