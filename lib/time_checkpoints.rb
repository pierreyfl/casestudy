class Time

  def self.checkpoints_for_last count, units
    case units
    when "days", "day" 
      dates = count.times.map{|i| Time.now.end_of_day - i.days}
    when "weeks", "week"
      dates = count.times.map{|i| Time.now.end_of_day - i.weeks}
    when "months", "month"
      dates = count.times.map{|i| Time.now.end_of_day - i.months}
    when "quarters", "quarter"
      dates = count.times.map{|i| Time.now.end_of_day - i*3.months}
    end
    dates[0] = Time.now
    p dates
    dates.reverse
  end

  def self.days_for_last units
    case units
    when "week" 
      dates = 7.times.map{|i| Time.now.end_of_day - i.days}
    when "month"
      dates = (Date.today-1.month..Date.today).count.times.map{|i| Time.now.end_of_day - i.days}
    when "6 months"
      dates = (Date.today-6.month..Date.today).count.times.map{|i| Time.now.end_of_day - i.days}
    when "year"
      dates = (Date.today-1.year..Date.today).count.times.map{|i| Time.now.end_of_day - i.days}
    end
    dates[0] = Time.now
    p dates
    dates.reverse
  end

end
