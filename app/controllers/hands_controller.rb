class HandsController < ApplicationController
  def rule

   #画面入力情報の受け取り
   input = params[:content]
   cards = input.split
   i = 0
   suit = []
   number = []

   puts suit

   #スートと数字に分けて格納
   cards.each do|card|
    suit[i] = card.scan(/[a-z]/)
    number[i] = card.scan(/[^a-z]/)
    i += 1
   end

   #役判定ロジック


   #画面に結果を表示
   flash[:notice] = suit + number
   render("home/top")

  end
end
