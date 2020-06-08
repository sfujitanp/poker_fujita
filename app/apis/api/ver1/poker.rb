module API
  module Ver1
    class Poker < Grape::API
      include Judge
      resource :poker do

        #POST /api/v1/poker
        desc 'judge cards rank'
        params do
          requires :cards, type: Array[String]
        end
        post :check do

          #入力情報を格納する
          @cards=params[:cards]

          card_instances =[]
          @cards.each do |n|
            card_instances << Card.new(n)
          end

          #バリデーションを確認し、responseを返す
          Card.judge_best_rank(card_instances)

        end
      end
    end
  end
end
