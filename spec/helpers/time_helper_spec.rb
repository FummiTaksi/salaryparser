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
end