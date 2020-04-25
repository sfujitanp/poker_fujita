class HomeController < ApplicationController
  def top
  end
  def check
    redirecit_to("/home/top")
  end 
end
