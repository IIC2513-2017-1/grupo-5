class CreateParticipationTable < ActiveRecord::Migration[5.0]
  def change
    create_table :participations do |t|
      t.integer :placing, null: false
    end
    add_reference :participations, :player, foreign_key: true
    add_reference :participations, :match, foreign_key: true
  end
end
