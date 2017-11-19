class SalariesController < ApplicationController

  include FileHelper,SalariesHelper

  def index

  end

  def import
    file = params[:file];
    handleFile(file);
    redirect_to root_url
  end

end
