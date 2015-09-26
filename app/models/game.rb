class Game < ActiveRecord::Base
  belongs_to :betslip, :inverse_of => :games
  
  private
  
  def trigger_status_saved
     betslip.status_saved if !self.status.nil?
   end
   

  
end
