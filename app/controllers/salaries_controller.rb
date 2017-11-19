class SalariesController < ApplicationController

  include FileHelper, ReportsHelper

  def index

  end

  def import
    file = params[:file];
    handleFile(file);
    redirect_to root_url
  end

end
