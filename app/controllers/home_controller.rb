class HomeController < ApplicationController
  def top
  end
  def check
    redirect_to("/home/top")
  end 
end
