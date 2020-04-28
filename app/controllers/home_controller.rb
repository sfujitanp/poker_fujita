class HomeController < ApplicationController

  def top
  end

  def check
    input = params[:content]
    flash[:notice]=input
    redirect_to("/home/top")    
  end 

end
