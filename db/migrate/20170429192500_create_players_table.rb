class CreatePlayersTable < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.text :name, null: false
      t.text :description
    end
  end
end
