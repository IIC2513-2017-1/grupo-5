class DeletePlayerIdFromParticipations < ActiveRecord::Migration[5.0]
  def change
    #remove_index :participations, :player_id
    #remove_column :participations, :player_id
  end
end
