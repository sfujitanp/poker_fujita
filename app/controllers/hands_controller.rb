class HandsController < ApplicationController
  include Judge


  def rule
   #入力情報を格納
    input = params[:content]

    #画面に結果を表示
   flash[:notice] = judge(input)

   render("home/top")

  end
end
