module FileHelper

  require 'csv'
  include ReportsHelper

  def isFileCsv(file)
    fileName = file.original_filename;
    return File.extname(fileName) == ".csv";
  end

  def handleFile(file)
    if (isFileDefined(file))
      defineFileType(file);
    else
      flash[:error] = "File not found!"
    end
  end

  def informIsFileInRightFormat(file)
    if (fileIsInRightFormatForCalculation(file))
      flash[:notice] = "File is in the right format!"
    else
      flash[:error] = "File is in wrong format. Please modify file and try again."
    end
  end


  def defineFileType(file)
    if (isFileCsv(file))
        informIsFileInRightFormat(file);
    else
      flash[:error] = "File not .csv type!"
    end
  end

  def isFileDefined(file)
    return !file.nil?
  end



end