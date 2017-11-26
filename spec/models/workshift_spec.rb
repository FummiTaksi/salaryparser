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

  describe "countNormalWage " do
     it "counts it correctly " do
       startTime = DateTime.new(2015,5,5,21,30,0);
       endTime = DateTime.new(2015,5,5,23,0,0)
       workshift = Workshift.new(starttime: startTime, endtime: endTime);
       expect(workshift.countTheNormalWage).to eq 5.625
     end
  end

  describe "shiftStartedInNightHours " do

    describe "returns true when " do

      it "start time is at 18" do
        startTime = DateTime.new(2015,5,5,18,0,0);
        endTime = DateTime.new(2015,5,5,23,0,0)
        workshift = Workshift.new(starttime: startTime, endtime: endTime);
        expect(workshift.shiftStartedInNightHours).to be_truthy
      end

      it "start time is at 5" do
        startTime = DateTime.new(2015,5,5,5,59,0);
        endTime = DateTime.new(2015,5,5,23,0,0)
        workshift = Workshift.new(starttime: startTime, endtime: endTime);
        expect(workshift.shiftStartedInNightHours).to be_truthy
      end
    end

    describe "returns false when " do
      it "starts in 6 " do
        startTime = DateTime.new(2015,5,5,6,0,0);
        endTime = DateTime.new(2015,5,5,23,0,0)
        workshift = Workshift.new(starttime: startTime, endtime: endTime);
        expect(workshift.shiftStartedInNightHours).to be_falsey
      end
    end
  end

  describe "shiftEndsInNightHours " do
    describe "returns true when " do

      it "end time is at 18" do
        startTime = DateTime.new(2015,5,5,20,0,0);
        endTime = DateTime.new(2015,5,5,18,0,0)
        workshift = Workshift.new(starttime: startTime, endtime: endTime);
        expect(workshift.shiftEndsInNightHours).to be_truthy
      end

      it "end time is at 5" do
        startTime = DateTime.new(2015,5,5,23,59,0);
        endTime = DateTime.new(2015,5,5,5,0,0)
        workshift = Workshift.new(starttime: startTime, endtime: endTime);
        expect(workshift.shiftEndsInNightHours).to be_truthy
      end
    end

    describe "returns false when " do
      it "ends in 6 " do
        startTime = DateTime.new(2015,5,5,23,0,0);
        endTime = DateTime.new(2015,5,5,6,0,0)
        workshift = Workshift.new(starttime: startTime, endtime: endTime);
        expect(workshift.shiftEndsInNightHours).to be_falsey
      end
    end
  end

  describe "countEveningBonusTime " do

    describe "when shift starts in evening hours " do

      describe "and ends in evening hours " do

        it "method returns correct " do
          startTime = DateTime.new(2015,5,5,23,0,0);
          endTime = DateTime.new(2015,5,6,3,0,0)
          workshift = Workshift.new(starttime: startTime, endtime: endTime);
          expect(workshift.countEveningBonusTime).to eq 4.0
        end

      end

      describe "and ends after evening hours " do

          it "method returns correct " do
            startTime = DateTime.new(2015,5,5,23,0,0);
            endTime = DateTime.new(2015,5,6,7,0,0)
            workshift = Workshift.new(starttime: startTime, endtime: endTime);
            expect(workshift.countEveningBonusTime).to eq 7.0
          end

      end
    end

    describe "when shift starts before evening hours " do

      describe "and ends before evening hours " do

        it "method returns 0" do
          startTime = DateTime.new(2015,5,5,16,0,0);
          endTime = DateTime.new(2015,5,5,17,59,0)
          workshift = Workshift.new(starttime: startTime, endtime: endTime);
          expect(workshift.countEveningBonusTime).to eq 0.0
        end

      end

      describe "and ends in evening hours " do

        it "method returns correct" do
          startTime = DateTime.new(2015,5,5,16,0,0);
          endTime = DateTime.new(2015,5,5,23,0,0)
          workshift = Workshift.new(starttime: startTime, endtime: endTime);
          expect(workshift.countEveningBonusTime).to eq 5.0
        end

      end

      describe "and ends after evening hours " do

        it "method returns 10 " do
          startTime = DateTime.new(2015,5,5,16,0,0);
          endTime = DateTime.new(2015,5,6,6,1,0)
          workshift = Workshift.new(starttime: startTime, endtime: endTime);
          expect(workshift.countEveningBonusTime).to eq 10.0
        end

      end
    end
  end

  describe "calculateEveningBonus " do
    it "calculates correct number " do
      startTime = DateTime.new(2015,5,5,16,0,0);
      endTime = DateTime.new(2015,5,6,6,1,0)
      workshift = Workshift.new(starttime: startTime, endtime: endTime);
      expect(workshift.calculateEveningBonus).to eq 11.5
    end
  end

end
