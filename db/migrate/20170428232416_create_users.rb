class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :email
      t.text :first_name
      t.text :last_name
      t.text :password
      t.integer :coins
      t.integer :role

      t.timestamps
    end
  end
end
