class Betslip < ActiveRecord::Base
  has_many :games
  accepts_nested_attributes_for :games, allow_destroy: true

  after_update :update_balance
  belongs_to :account
  
  def status_saved
    # self.name is now "Software Engineering"
    self.status = self.update(status: self.games.first.status)
    # self.name is now "Software Engineering!"
  end
  
  def update_balance
    balance = self.account.user.accounts.last.balance
    accounts = self.account.user.accounts
    if self.winnings == 0 
      accounts.create(balance: balance - self.stake)
    else
      accounts.create(balance: balance + self.winnings)
    end
  end
  
    
  
    
end
