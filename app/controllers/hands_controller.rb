class HandsController < ApplicationController
  include Judge

  def top
  end


  #バリデーションを確認し、結果を返却する
  def judge
    card = Card.new(input)

    if  card.valid? then
       flash[:notice] = card.rank_judge  #戻り値が役名
    else
       flash[:notice] = "5つのカード指定文字を半角スペース区切りで入力してください。（例：S1 H3 D9 C13 S11）"
    end
    render("hands/top")
  end

  private

  #入力情報を格納
  def input
    params[:content]
  end

end

