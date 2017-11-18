require 'rails_helper'

RSpec.describe FileHelper, type: :helper do

  it "returns true if filename is .csv" do
    csvFile = getFile("wage.csv")
    expect(isFileCsv(csvFile)).to eq true
  end

  it "returns false if filename is .pdf" do
    pdfFile = getFile("wage.pdf")
    expect(isFileCsv(pdfFile)).to eq false
  end

  def getFile(fileName)
    return ActionDispatch::Http::UploadedFile.new tempfile: 'tempfile', filename: fileName
  end

end