module FileHelper

  def isFileCsv(file)
    if file.nil?
      return false;
    end
    fileName = file.original_filename;
    return File.extname(fileName) == ".csv";
  end

end