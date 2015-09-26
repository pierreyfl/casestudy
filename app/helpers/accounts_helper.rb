module AccountsHelper
  def products_chart_data
    first_date = Account.where(user_id: current_user.id).first
    first_date = first_date.created_at.to_date
    orders_by_day = Account.total_grouped_by_day(first_date,current_user)
    rtn_ary = [{created_at: first_date.prev_day.to_date, balance: 1000}]
    (first_date..Date.today).map do |date|
      rtn_ary << { created_at: date, balance: orders_by_day[date].try(:first).try(:total_balance) || rtn_ary.last[:balance]}
    end
    rtn_ary
  end
end
