class ChangeBalanceDefaultInUsers < ActiveRecord::Migration
  def change
    change_column :users, :balance, :integer, default: 1000
  end
end
