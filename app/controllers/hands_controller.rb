class HandsController < ApplicationController
  def rule

   #画面入力情報の受け取り
   input = params[:content]
   cards = input.split
   i = 0
   suits = []
   numbers = []


   #スートと数字に分けて格納
   cards.each do|card|
    suits[i] = card.scan(/[a-z]/)
    numbers[i] = card.scan(/[^a-z]/)
    i += 1
   end

   #役判定ロジック
   #判定結果をranksに格納していく
   ranks = []

   #①全部同じスートかどうか
   if suits.uniq.count == 1 then
     ranks[0] = 1
   elsif
      ranks[0] = 0
   end


   #②５枚が連続した数字か


   #画面に結果を表示
   flash[:notice] = ranks

   render("home/top")

  end
end
