class Workshift < ActiveRecord::Base

  def countDifferenceInHours
    return (endtime - starttime) / 3600.0;
  end

end
