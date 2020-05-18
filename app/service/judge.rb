module Judge

  class Card

    def initialize (input)
      @input = input
    end

    def valid?
      regulation = /[S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])\ [S,H,D,C](1[0-3]|[1-9])/
      return false unless @input =~ regulation
      cards = @input.split(" ")
      return false if cards.count != 5
      return false if cards.uniq.count != 5
      true
    end


     def rank_judge
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
       rank = {name:"", rank_number:""}

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
         rank[:name] = "ストレートフラッシュ"
         rank[:rank_number] = 1
       elsif rank_element[:same_number_count]==[1,4]
         rank[:name] = "フォー・オブ・ア・カインド"
         rank[:rank_number] = 2
       elsif rank_element[:same_number_count]==[2,3]
         rank[:name] = "フルハウス"
         rank[:rank_number] = 3
       elsif rank_element[:same_suits] == true
         rank[:name] = "フラッシュ"
         rank[:rank_number] = 4
       elsif rank_element[:serial_number] == true
         rank[:name] = "ストレート"
         rank[:rank_number] = 5
       elsif rank_element[:same_number_count]==[1,1,3]
         rank[:name] = "スリー・オブ・ア・カインド"
         rank[:rank_number] = 6
       elsif rank_element[:same_number_count]==[1,2,2]
         rank[:name] = "ツーペア"
         rank[:rank_number] = 7
       elsif rank_element[:same_number_count]==[1,1,1,2]
         rank[:name] = "ワンペア"
         rank[:rank_number] = 8
       else
         rank[:name] = "ハイカード"
         rank[:rank_number] = 9
       end
       rank[:name]

     end
  end
end