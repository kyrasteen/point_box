class CreateRewardsTable < ActiveRecord::Migration
  def change
    create_table :rewards do |t|
      t.text :name
      t.integer :cost
    end
  end
end
