class HandsController < ApplicationController
  def rule
   #cards = @input.split(" ")
   #flash['notice'] = cards
   input = params[:content]
   flash[:notice] = input

   render("home/top")

  end
end
