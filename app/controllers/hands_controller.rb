class HandsController < ApplicationController
  def rule

   #入力情報を格納
    input = params[:content]
    suits = input.scan(/[a-zA-Z]/)
    numbers = input.scan(/\d/).sort

   #数字の差分を格納
    diff = []
    (0..3).each do |j|
      diff[j] = (numbers[j+1].to_i - numbers[j].to_i)
    end

   #判定結果の格納先を定義
   rank = {name:"", same_suits:0, serial_number:0, same_number:0}

   #要素① 同じスートか
   if suits.uniq.count == 1 then
     rank[:same_suits] = 1
   end

   #要素② 連続した数字か
   if diff == [1,1,1,1] || diff.sort == [1,1,1,9] then
     rank[:serial_number] = 1
   end

   #要素③ 同じ数字の配置
   same_count = diff.count(0)
   case same_count
   when 4
     rank[:same_number]=5
   when 3
     if diff[0] != 0 || diff[3] !=0 then rank[:same_number]=5
     else rank[:same_number]=4
     end
   when 2
     if    diff[0] == 0 && diff[1] ==0 then rank[:same_number]=3
     elsif diff[2] == 0 && diff[3] ==0 then rank[:same_number]=3
     elsif diff[1] == 0 && diff[2] ==0 then rank[:same_number]=3
     else
      rank[:same_number]=2
     end
   when 1
     rank[:same_number]=1
   else
     rank[:same_number]=0
   end

   #役名を定義
    if rank[:same_suits] == 1 && rank[:serial_number] == 1
      rank[:name] = "ストレートフラッシュ"
    elsif rank[:same_number]==5
      rank[:name] = "フォー・オブ・ア・カインド"
    elsif rank[:same_number]==4
      rank[:name] = "フルハウス"
    elsif rank[:same_suits] == 1
      rank[:name] = "フラッシュ"
    elsif rank[:serial_number] == 1
      rank[:name] = "ストレート"
    elsif rank[:same_number]==3
      rank[:name] = "スリー・オブ・ア・カインド"
    elsif rank[:same_number]==2
      rank[:name] = "ツーペア"
    elsif rank[:same_number]==1
      rank[:name] = "ワンペア"
    else
      rank[:name] = "ハイカード"
   end

   #画面に結果を表示
   flash[:notice] = rank[:name]

   render("home/top")

  end
end
