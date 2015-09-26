class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :match
      t.string :type_bet
      t.string :selection
      t.float :odds
      t.string :status

      t.timestamps null: false
    end
  end
end
