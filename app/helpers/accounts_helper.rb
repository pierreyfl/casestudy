module AccountsHelper

  def chart_by(type)
    type = "last_month" if type.blank?
    chart = Account.chart(type, current_user)
    rtn_ary = []
    chart.each do |item|
      rtn_ary << {created_at: item.first.to_date, balance: item.last}
    end
    rtn_ary
  end

end
