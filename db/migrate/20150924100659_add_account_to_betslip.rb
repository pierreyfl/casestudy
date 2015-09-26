class AddAccountToBetslip < ActiveRecord::Migration
  def change
    add_reference :betslips, :account, index: true, foreign_key: true
  end
end
