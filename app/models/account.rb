class Account < ActiveRecord::Base
  belongs_to :user
  
  def self.balance_on_the_date(time, user = nil)
    user.accounts.where("created_at <= ?", time).order("created_at ASC").pluck(:balance).last || 0
  end

  def self.include_start_balance_if_need chart, type, user
    return chart unless type == "last_week"
    start_account = user.accounts.first
    end_of_start_day = start_account.created_at.localtime.end_of_day
    if chart.map{|c| c.first}.include? end_of_start_day and !chart.include?([end_of_start_day => start_account.balance])
      chart[start_account.created_at.localtime] = start_account.balance
    end
    chart.sort
  end

  def self.chart(type = "weeks", user)
    case type
    when "last_week"
      dates = Time.checkpoints_for_last 7, "days"
    #when "last_month"
    #  dates = Time.checkpoints_for_last 4, "weeks"
    when "last_6_months"
      dates = Time.checkpoints_for_last 6, "months"
    when "last_year"
      dates = Time.checkpoints_for_last 4, "quarters"
    else
      dates = Time.checkpoints_for_last 4, "weeks"
    end
    chart = {}
    dates.map{|date| chart[date] = self.balance_on_the_date(date, user)}
    chart = self.include_start_balance_if_need(chart, type, user)
  end
  
end
