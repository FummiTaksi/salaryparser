require 'rails_helper'

RSpec.describe TimeHelper, type: :helper do

  describe "endTimeIsOnNextDay " do

    describe "returns true when " do

      it "end hour is smaller than start hour " do
        expect(endTimeIsOnNextDay(23, 22, 00, 21)).to be_truthy
      end

      it "hours are same, and end minute is smaller than start minute" do
        expect(endTimeIsOnNextDay(16, 55, 16 ,54)).to be_truthy
      end

      it "hours and minutes are same" do
        expect(endTimeIsOnNextDay(16 ,00, 16, 00)).to be_truthy
      end
    end

    describe "returns false when " do

      it "end hour is greater than start hour " do
        expect(endTimeIsOnNextDay(10,59,11,00)).to be_falsey
      end
    end
  end

  describe "generateWorkShift " do
    let(:date){Date.new(2015,5,5)}

    it "has correct start time" do
      workshift = generateWorkShift(date,22,22,15,15);
      expected = DateTime.new(2015,5,5,22,22,0);
      expect(workshift.starttime - expected == 0.0).to be_truthy
    end

    describe "when endtime is on same day " do

      it "is correct" do
        workshift = generateWorkShift(date, 22,22,23,23);
        expect(workshift.endtime.day).to eq 5
      end

    end

    describe "when endtime is on next day " do
      it "is correct" do
        workshift =  generateWorkShift(date, 22,22, 0, 5);
        expect(workshift.endtime.day).to eq 6
      end
    end
  end
end