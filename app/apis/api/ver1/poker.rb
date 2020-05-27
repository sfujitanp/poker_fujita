module API
  module Ver1
    class Poker < Grape::API
      include Judge
      resource :poker do
        #
        # # GET /api/v1/poker
        # desc 'return cards rank'
        # get do
        #
        # end

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

          #バリデーションを確認し、ランクを判定する
          card_instances.each do |card|
            if card.valid?
              card.judge_rank
              card.rank_name
            else
              puts "カード内容が適切でない"
            end
          end

          #最も強いカードを判定する
          Card.best_rank(card_instances)
        end
      end
    end
  end
end
