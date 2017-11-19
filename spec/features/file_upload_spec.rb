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
  end

  describe "is successful when " do

    it "user imports a .csv file " do
      attach_file("file", Rails.root + "spec/testfiles/correctWageFile.csv");
      click_on("Import CSV");
      expect(page).to have_content "File is in the right format!"
    end

  end
end