module AccountsHelper
  def products_chart_data
    orders_by_day = Account.total_grouped_by_day(30.days.ago,current_user)
    rtn_ary = [{created_at: 31.days.ago.to_date, balance: 1000}]
    (30.days.ago.to_date..Date.today).map do |date|
      rtn_ary << { created_at: date, balance: orders_by_day[date].try(:first).try(:total_balance) || rtn_ary.last[:balance]}
    end
    rtn_ary
  end
end
