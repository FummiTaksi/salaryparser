module DateHelper

  def areDatesInSameMonth(oldDate, newDate)
    return oldDate.month == newDate.month && oldDate.year == newDate.year;
  end

  def isClockTime(param)
    /^([0-9]|0[0-9]|1[0-9]|2[0-3]):[0-5][0-9]$/.match(param)
  end

end