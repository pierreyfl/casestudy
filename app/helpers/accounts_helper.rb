module AccountsHelper
  def products_chart_data
    orders_by_day = Account.total_grouped_by_day(30.days.ago,current_user)
    first_entry = Account.where("user_id='"+current_user.id.to_s+"' and created_at<='"+31.days.ago.strftime("%Y-%m-%d 23:59:59")+"'").last
    if first_entry
     rtn_ary = [{created_at: 31.days.ago.to_date, balance: first_entry.balance}]
    else
     rtn_ary = [{created_at: 31.days.ago.to_date, balance: 0}]
    end
    orders_by_day = Account.total_grouped_by_day(31.days.ago.to_date,current_user)
    (30.days.ago.to_date..Date.today).map do |date|
      rtn_ary << { created_at: date, balance: orders_by_day[date].try(:first).try(:total_balance) || rtn_ary.last[:balance]}
    end
    rtn_ary
  end
end
