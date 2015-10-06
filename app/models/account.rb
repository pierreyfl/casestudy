class Account < ActiveRecord::Base
  belongs_to :user
  
  def self.balance_on_the_date(time, user = nil)
    user.accounts.where("created_at <= ?", time).order("created_at ASC").pluck(:balance).last || 0
  end

  def self.include_start_balance_if_need chart, type, user
    return chart unless type == "1"
    start_account = user.accounts.first
    end_of_start_day = start_account.created_at.localtime.end_of_day
    if chart.map{|c| c.first}.include? end_of_start_day and !chart.include?([end_of_start_day => start_account.balance])
      chart[start_account.created_at.localtime] = start_account.balance
    end
    chart.sort
  end

  def self.chart(type = 2, user)
    case type
    when 1 #days 
      dates = Time.days_for_last "week"
    when 2 #weeks
      dates = Time.days_for_last "month"
    when 3 #months
      dates = Time.days_for_last "6 months"
    when 4 #quarters
      dates = Time.days_for_last "year"
    end
    chart = {}
    dates.map{|date| chart[date] = self.balance_on_the_date(date, user)}
    chart = self.include_start_balance_if_need(chart, type, user)
  end
  
end
