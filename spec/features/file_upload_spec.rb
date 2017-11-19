require 'rails_helper'


describe "Uploading file from the root-page" do

  before :each do
    visit root_path
  end

  describe "fails when" do

    it "user clicks import button without selecting a file " do
      click_on("Import CSV")
      expect(page).to have_content "File not found!"
    end

    it "user imports .txt file " do
      attach_file("file", Rails.root + "spec/testfiles/test.txt");
      click_on("Import CSV");
      expect(page).to have_content "File not .csv type!"
    end

    it "user imports a file with unvalid date" do
      attach_file("file", Rails.root + "spec/testfiles/dateIsNotValid.csv");
      click_on("Import CSV");
      expect(page).to have_content "File is in wrong format. Please modify file and try again."
    end

    it "user imports a file with unvalid end time" do
      attach_file("file", Rails.root + "spec/testfiles/endTimeNotCorrect.csv");
      click_on("Import CSV");
      expect(page).to have_content "File is in wrong format. Please modify file and try again."
    end

    it "user imports a file where name column is empty" do
      attach_file("file", Rails.root + "spec/testfiles/nameIsEmpty.csv");
      click_on("Import CSV");
      expect(page).to have_content "File is in wrong format. Please modify file and try again."
    end

    it "user imports a file where personId contains letters" do
      attach_file("file", Rails.root + "spec/testfiles/personIdIsAString.csv");
      click_on("Import CSV");
      expect(page).to have_content "File is in wrong format. Please modify file and try again."
    end

    it "user imports a file where start time is not valid" do
      attach_file("file", Rails.root + "spec/testfiles/startTimeNotCorrect.csv");
      click_on("Import CSV");
      expect(page).to have_content "File is in wrong format. Please modify file and try again."
    end


  end

  describe "is successful when " do

    it "user imports a .csv file " do
      attach_file("file", Rails.root + "spec/testfiles/correctWageFile.csv");
      click_on("Import CSV");
      expect(page).to have_content "File is in the right format!"
    end

  end
end