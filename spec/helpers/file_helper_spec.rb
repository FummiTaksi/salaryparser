require 'rails_helper'

RSpec.describe FileHelper, type: :helper do
  let(:csvFile){ getCsvFile()}
  let(:pdfFile){getPdfFile()}

  def getFile(fileName)
    return ActionDispatch::Http::UploadedFile.new tempfile: 'tempfile', filename: fileName
  end

  def getCsvFile()
    return getFile("file.csv");
  end

  def getPdfFile()
    return getFile("file.pdf");
  end

  describe "isFileCsv" do

    it "returns true if filename is .csv" do
      expect(isFileCsv(csvFile)).to be_truthy
    end

    it "returns false if filename is .pdf" do
      expect(isFileCsv(pdfFile)).to be_falsey
    end
  end

  describe "isFileDefined" do

    it "returns true when file is defined" do
      expect(isFileDefined(csvFile)).to be_truthy
    end

    it "returns false if file is nil " do
      expect(isFileDefined(nil)).to be_falsey
    end

  end

  describe "defineFileType" do

    it "shows flash notice if file is .csv type" do
        defineFileType(csvFile);
        expect(flash[:notice]).to be_present
    end

    it "shows flash error if file is not .csv type" do
        defineFileType(pdfFile);
        expect(flash[:error]).to be_present
    end

  end

  describe "handleFile" do

    it "shows flash error if file is not defined" do
        handleFile(nil);
        expect(flash[:error]).to be_present
    end

    it "shows flash notice if file is .csv type" do
        handleFile(csvFile);
        expect(flash[:notice]).to be_present
    end

    it "shows flash error if file is not .csv type" do
        handleFile(pdfFile);
        expect(flash[:error]).to be_present
    end
  end





end