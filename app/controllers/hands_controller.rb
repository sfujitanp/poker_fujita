class HandsController < ApplicationController
  def rule
   cards = input.split(" ")
   flash[:notice] = cards
   render("home/top")

  end
end
