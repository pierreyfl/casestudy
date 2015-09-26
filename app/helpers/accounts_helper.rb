module AccountsHelper
  def products_chart_data
    orders_by_day = Account.total_grouped_by_day(30.days.ago)
    (30.days.ago.to_date..Date.today).map do |date|
      {created_at: date, 
        balance: orders_by_day[date].try(:first).try(:total_balance) || 0
      }
    end
  end

end