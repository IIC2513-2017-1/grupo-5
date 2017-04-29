class EditTeams < ActiveRecord::Migration[5.0]
  def change
    change_column_null :teams, :name, false
    add_reference :participations, :team, foreign_key: true
  end
end
