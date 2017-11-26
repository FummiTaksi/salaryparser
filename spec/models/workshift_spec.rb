require 'rails_helper'

RSpec.describe Workshift, type: :model do

  describe "count difference " do
    it "counts it correctly " do
      startTime = DateTime.new(2015,5,5,21,30,0);
      endTime = DateTime.new(2015,5,5,23,0,0)
      workshift = Workshift.new(starttime: startTime, endtime: endTime);
      expect(workshift.countDifferenceInHours).to eq 1.5;
    end
  end

end
