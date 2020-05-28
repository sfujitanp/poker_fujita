module Judge

  class Card
    attr_reader :rank_name, :rank_number, :cards, :input, :msg

    def initialize (input)
      @input = input
    end

    def Card.best_rank(card_instances)
      #最も強いランクを確認する
      min_rank_number = 9
      card_instances.each do |card|
        if card.valid2?
          card.judge_rank
          min_rank_number = [min_rank_number, card.rank_number].min
        end
      end

      #responseの体裁を整える
      result = []
      error = []
      card_instances.each do |card|
        if card.valid2?
          if card.rank_number == min_rank_number
            best = "true"
          else
            best = "false"
          end
          result << ({
              "card": card.input,
              "hand": card.rank_name,
              "best": best
          })
        else
          error << ({
              "card": card.input,
              "msg": card.msg
          })
        end
      end

      if error.count > 0
        response = {"result": result, "error": error}
      else
        response = {"result": result}
      end

      return response
    end


    def valid2?
      regulation = /[S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])/
      @cards = @input.split(" ")

      if @cards.count != 5
        @msg = "5つのカード指定文字を半角スペース区切りで入力してください。"
        false
      elsif @cards.uniq.count != 5
        @msg = "カードが重複しています"
        false
      elsif @input =~ regulation
        true
      else
        @msg = ""
        @cards.each_with_index do |n, i|
          unless n =~ /[S,H,D,C](1[0-3]|[1-9])/
            @msg << "#{i+1}番目のカード指定文字が不正です。(#{n})　"
          end
        end
        false
      end

    end


    def valid?
      regulation = /[S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])/
      return false unless @input =~ regulation
      @cards = @input.split(" ")
      return false if @cards.count != 5
      return false if @cards.uniq.count != 5
      true
    end


     def judge_rank
       suits = @input.scan(/[S,H,D,C]/)
       numbers_s = @input.scan(/1[0-3]|[1-9]/)
       numbers = numbers_s.map {|n| n.to_i}.sort

       #数字の差分を格納
       diff = []
       (0..3).each do |j|
         diff[j] = (numbers[j+1] - numbers[j])
       end

       #判定結果の格納先を定義
       rank_element = {same_suits:false , serial_number:false , same_number_count:[]}

       #要素① 同じスートか
       if suits.uniq.count == 1 then
         rank_element[:same_suits] = true
       end

       #要素② 連続した数字か
       if diff == [1,1,1,1] || diff.sort == [1,1,1,9] then
         rank_element[:serial_number] = true
       end

       #要素③ 同じ数字が何個ずつあるかを計算する
       uniq_number = numbers.uniq
       rank_element[:same_number_count] = uniq_number.map {|n| numbers.count(n)}.sort

       #役名と強さを格納する
       if rank_element[:same_suits] == true && rank_element[:serial_number] == true
         @rank_name = "ストレートフラッシュ"
         @rank_number = 1
       elsif rank_element[:same_number_count]==[1,4]
         @rank_name = "フォー・オブ・ア・カインド"
         @rank_number = 2
       elsif rank_element[:same_number_count]==[2,3]
         @rank_name = "フルハウス"
         @rank_number = 3
       elsif rank_element[:same_suits] == true
         @rank_name = "フラッシュ"
         @rank_number = 4
       elsif rank_element[:serial_number] == true
         @rank_name = "ストレート"
         @rank_number = 5
       elsif rank_element[:same_number_count]==[1,1,3]
         @rank_name = "スリー・オブ・ア・カインド"
         @rank_number = 6
       elsif rank_element[:same_number_count]==[1,2,2]
         @rank_name = "ツーペア"
         @rank_number = 7
       elsif rank_element[:same_number_count]==[1,1,1,2]
         @rank_name = "ワンペア"
         @rank_number = 8
       else
         @rank_name = "ハイカード"
         @rank_number = 9
       end

     end
  end
end