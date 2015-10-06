class Time

  def self.checkpoints_for_last count, units
    case units
    when "days", "day" 
      dates = count.times.map{|i| Time.now.end_of_day - i.days}
    when "weeks", "week"
      dates = count.times.map{|i| Time.now.end_of_day - i.weeks}
    when "months", "month"
      dates = count.times.map{|i| (Time.now.end_of_day - i.months).beginning_of_month}
      dates.unshift(Date.today) unless Date.today == Date.today.beginning_of_month
    when "quarters", "quarter"
      dates = count.times.map{|i| (Time.now.end_of_day - i*3.months).beginning_of_quarter}
      dates.unshift(Date.today) unless Date.today == Date.today.beginning_of_quarter
    end
    dates[0] = Time.now
    p dates
    dates.reverse
  end

end
