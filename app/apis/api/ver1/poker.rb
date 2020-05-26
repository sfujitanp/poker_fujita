module API
  module Ver1
    class Poker < Grape::API
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
        post do


          @cards=params[:cards]

          card_instances =[]
          @cards.each do |n|
            card_instances << Card.new(n)
          end

          card_instances.each do |card|
            if card.valid?
              card.judge_rank
              puts card.rank_name
            else
              puts "カード内容が適切でない"
            end
          end

          Card.best_rank(card_instances)
        end
      end
    end
  end
end
