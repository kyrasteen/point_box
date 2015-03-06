class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.text :password
      t.integer :role
    end
  end
end
