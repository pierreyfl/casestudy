class AddBetslipToGame < ActiveRecord::Migration
  def change
    add_reference :games, :betslip, index: true, foreign_key: true
  end
end
