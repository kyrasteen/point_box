class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.boolean :redeemed?
    end
  end
end
