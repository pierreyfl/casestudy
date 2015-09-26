class HomeController < ApplicationController
  
  def index
    @balance = current_user.accounts.last.balance
  end
  
end
