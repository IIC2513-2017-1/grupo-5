class ForeignKeysMatches < ActiveRecord::Migration[5.0]
  def change
    remove_column :bets, :match_id
    add_reference :bets, :match, foreign_key: true
    change_column_null :matches, :match_date, false
    change_column_null :matches, :bet_date, false
    change_column_null :matches, :state, false
    change_column_null :events, :type, false
    change_column_null :events, :private, false
    rename_column :events, :start, :date_start
    rename_column :events, :end, :date_end
    change_column_null :events, :date_start, false
    change_column_null :events, :date_end, false

  end
end
