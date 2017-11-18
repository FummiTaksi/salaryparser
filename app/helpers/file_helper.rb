module FileHelper

  def isFileCsv(file)
    fileName = file.original_filename;
    return File.extname(fileName) == ".csv";
  end

end