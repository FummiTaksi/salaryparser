require 'rails_helper'

RSpec.describe DateHelper, type: :helper do

  describe "areDatesInSameMonth " do

    describe "returns true when " do

      it "month and year are same" do
        date = Date.new(2015,6,6);
        date2 = Date.new(2015,6,21);
        expect(areDatesInSameMonth(date, date2)).to be_truthy
      end

    end

    describe "return false when " do

      it "month is same but year different" do
        date = Date.new(2015,6,6);
        date2 = Date.new(2014,6,6);
        expect(areDatesInSameMonth(date,date2)).to be_falsey
      end

      it "year is same but month is different" do
        date = Date.new(2015,7,6)
        date2 = Date.new(2015,6,6)
        expect(areDatesInSameMonth(date,date2)).to be_falsey
      end

    end

  end

  describe "isClockTime " do

    describe "returns true when " do

      it "is legit clock time" do
        expect(isClockTime("00:00")).to be_truthy
      end

    end

    describe "returns false when " do

      it "is not legit clock time" do
        expect(isClockTime("24:01")).to be_falsey
      end
    end

  end

  describe "isValidDate " do

  end

end