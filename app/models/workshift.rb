class Workshift
  include ActiveModel::Validations

  attr_accessor :starttime, :endtime

  def countDifferenceInHours
    return (endtime - starttime) * 24.0;
  end

  def initialize(attributes = {})
    @starttime = attributes[:starttime]
    @endtime = attributes[:endtime]
  end

  def countTheNormalWage
    return countDifferenceInHours * 3.75;
  end

  def countEveningBonusTime
    sixInTheMorning = DateTime.new(starttime.year, starttime.month, starttime.day + 1 , 6, 0, 0);
    if shiftStartedInNightHours
      return shiftEndsInNightHours ? countDifferenceInHours : (sixInTheMorning - starttime) * 24.0;
    else
       return countEveningBonusTimeWhenItStartsBeforeEveningHours;
    end
  end

  def calculateEveningBonus
    return countEveningBonusTime * 1.15;
  end

  def countEveningBonusTimeWhenItStartsBeforeEveningHours
    sixInTheEvening = DateTime.new(starttime.year, starttime.month, starttime.day, 18, 0, 0);
    if shiftEndsInNightHours
      return (endtime -  sixInTheEvening) * 24.0;
    else
      return endtime.day > starttime.day ? 10.0 : 0;
    end
  end

  def shiftStartedInNightHours
    return starttime.hour >= 18 || starttime.hour < 6
  end

  def shiftEndsInNightHours
    return endtime.hour >= 18 || endtime.hour < 6
  end


end
