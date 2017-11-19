module TimeHelper

  def makeHourTimeObject(date, startTime, endTime)
    startTimeArray = startTime.split(":");
    endTimeArray = endTime.split(":");
    return HourTime.new hours: array[0], minutes: array[1];
  end

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
end