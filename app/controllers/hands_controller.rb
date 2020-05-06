class HandsController < ApplicationController
  def rule

   #入力情報をスートと数字に分けて格納
    input = params[:content]
    suits = input.scan(/[a-zA-Z]/)
    numbers = input.scan(/\d/).sort
     #TODO このタイミングで、整数に変換したい

   #数字の差分を格納
    diff = []
    (0..3).each do |j|
      diff[j] = (numbers[j+1].to_i - numbers[j].to_i)
    end

   #判定結果の格納先を定義
   ranks = {same_suits:0,serial_number:0,same_number:0}


   ###役判定ロジック###
   #①全部同じスートかどうか
   if suits.uniq.count == 1 then
     ranks[:same_suites] = 1
   end

   #②５枚が連続した数字か
   if diff == [1,1,1,1] || diff.sort == [1,1,1,9] then
     ranks[:serial_number] = 1
   end

   #③５枚が同じ数字が何個あるか
    if diff == [0,0,0,0] then
      ranks[:same_number] = 1
    end

   #画面に結果を表示
   flash[:notice] = ranks

   render("home/top")

  end
end
