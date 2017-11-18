class SalariesController < ApplicationController
  def index
  end

  def import
    file = params[:file];
    if (isFileCsv(file))
      flash[:notice]= "File uploaded successfully!"
    else
      flash[:error] = "File not .csv type!"
    end
    redirect_to root_url
  end

  def isFileCsv(file)
    fileName = file.original_filename;
    return File.extname(fileName) == ".csv";
  end
end
