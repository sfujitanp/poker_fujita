class HandsController < ApplicationController
  include Judge


  def rule
   #入力情報を格納
    input = params[:content]

    if  valid?(input) then
       flash[:notice] = judge(input)
    else
       flash[:notice] = "5つのカード指定文字を半角スペース区切りで入力してください。（例：S1 H3 D9 C13 S11）"
       end
   render("home/top")

  end
end
