class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.text :type
      t.text :gestor
      t.boolean :private
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
