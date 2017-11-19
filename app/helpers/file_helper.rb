module FileHelper

  def isFileCsv(file)
    fileName = file.original_filename;
    return File.extname(fileName) == ".csv";
  end

  def handleFile(file)
    if (isFileDefined(file))
      defineFileType(file)
    else
      flash[:error] = "File not found!"
    end
  end

  def defineFileType(file)
    if (isFileCsv(file))
      flash[:notice]= "File uploaded successfully!"
    else
      flash[:error] = "File not .csv type!"
    end
  end

  def isFileDefined(file)
    return !file.nil?
  end

end