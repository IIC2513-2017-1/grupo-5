class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.date :bet_date
      t.text :name
      t.integer :state

      t.timestamps
    end
  end
end
