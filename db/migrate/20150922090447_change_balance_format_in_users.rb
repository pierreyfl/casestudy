class ChangeBalanceFormatInUsers < ActiveRecord::Migration
  def change
    change_column :users, :balance, :decimal, precision: 5, scale: 2, default: 1000
  end
end
