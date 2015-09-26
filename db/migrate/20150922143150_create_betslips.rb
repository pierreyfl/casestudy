class CreateBetslips < ActiveRecord::Migration
  def change
    create_table :betslips do |t|
      t.float :stake
      t.float :winnings
      t.float :total_odds
      t.string :status

      t.timestamps null: false
    end
  end
end
