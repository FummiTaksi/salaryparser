class SalariesController < ApplicationController

  include FileHelper

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

end
