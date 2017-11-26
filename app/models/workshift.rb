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
end
