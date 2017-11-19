require 'rails_helper'

RSpec.describe ReportsHelper, type: :helper do
  let(:pekka){Worker.new workerId: 1, name: "pekka"}
  let(:jukka){Worker.new workerId: 2, name: "jukka"}
  let(:jukkis){Worker.new workerId: 2, name: "jukkis"}
  let(:arrayOfPekka){arrayWithOnlyPekka()}

  def arrayWithOnlyPekka
    return [pekka]
  end

  def arrayWithPekkaAndJukka
    return [pekka, jukka]
  end

  def getCorrectCsvFile
    return File.open(File.expand_path("#{Rails.root}/spec/testfiles/correctWageFile.csv"), 'r');
  end

  def getFileByName(fileName)
    return File.open(File.expand_path("#{Rails.root}/spec/testfiles/#{fileName}"), 'r');
  end

  describe "fileIsInRightFormatForCalculation " do

    describe "returns true when " do

      it "file is correct" do
        correctFile = getCorrectCsvFile();
        expect(fileIsInRightFormatForCalculation(correctFile)).to be_truthy
      end

    end

    describe "returns false when " do

      it "name is empty" do
        file = getFileByName("nameIsEmpty.csv");
        expect(fileIsInRightFormatForCalculation(file)).to be_falsey
      end

      it "personId cant be converted to string" do
        file = getFileByName("personIdIsAString.csv");
        expect(fileIsInRightFormatForCalculation(file)).to be_falsey
      end

      it "date is not valid" do
        file = getFileByName("dateIsNotValid.csv");
        expect(fileIsInRightFormatForCalculation(file)).to be_falsey
      end

      it "start time is not valid" do
        file = getFileByName("startTimeNotCorrect.csv");
        expect(fileIsInRightFormatForCalculation(file)).to be_falsey
      end

      it "end time is not valid" do
        file = getFileByName("endTimeNotCorrect.csv");
        expect(fileIsInRightFormatForCalculation(file)).to be_falsey
      end

      it "has two months" do
        file = getFileByName("fileWithTwoMonths.csv");
        expect(fileIsInRightFormatForCalculation(file)).to be_falsey
      end

    end
  end




  describe "thereIsWorkerWithSameIdButDifferentName " do

    describe "returns true when " do

      it "you try to add worker with same id and different name" do
          array = arrayWithPekkaAndJukka();
          expect(thereIsWorkerWithSameIdButDifferentName(array, jukkis)).to be_truthy
      end
    end

    describe "returns false when " do

      it "you add worker which has same id and same name" do
        array = arrayWithPekkaAndJukka();
        expect(thereIsWorkerWithSameIdButDifferentName(array, jukka)).to be_falsey
      end

      it "you add worker with different id and different name" do
        expect(thereIsWorkerWithSameIdButDifferentName(arrayOfPekka, jukka)).to be_falsey
      end
    end
  end

  describe "workerIsNotInTheList " do

    describe "returns true when " do

      it "worker is not in the list" do
        expect(workerIsNotInTheList(arrayOfPekka, jukka)).to be_truthy
      end

    end

    describe "returns false when " do

      it "worker is in the list " do
        expect(workerIsNotInTheList(arrayOfPekka, pekka)).to be_falsey
      end
    end

  end

  describe "addWorkerToList " do

    describe "when worker is not in the list " do

      it "is added to the list" do
        array = arrayOfPekka;
        addWorkerToList(array, jukka);
        expect(array.length).to eq 2
      end
    end

    describe "when worker is in the list " do

      it "is not added to the list" do
        array = arrayOfPekka;
        addWorkerToList(array,pekka);
        expect(array.length).to eq 1
      end
    end
  end

end