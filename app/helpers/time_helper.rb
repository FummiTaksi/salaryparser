module TimeHelper

  def endTimeIsOnNextDay(startHour, startMinute, endHour, endMinute)
    if endHour < startHour
      return true;
    end
    if endHour == startHour
      if endMinute <= startMinute
        return true;
      end
    end
    return false;
  end

  def generateWorkShift(date, startHour, startMinute, endHour, endMinute)
    startTime = DateTime.new(date.year, date.month, date.day, startHour, startMinute, 0);
    endTimeDay = endTimeIsOnNextDay(startHour, startMinute, endHour, endMinute) ?  date.day + 1 : date.day;
    endTime = DateTime.new(date.year, date.month, endTimeDay, endHour, endMinute, 0);
    return Workshift.new(starttime: startTime , endtime: endTime);
  end

end