require 'rails_helper'
# require_relative '../app/../../app/controllers/hands_controller'


RSpec.describe HandsController, type: :controller do

  it 'top画面で入力した内容がruleアクションでinputとして受け取っている' do

  end

  it 'cardインスタンスを作成できている' do

  end
  describe 'バリデーション' do

    it '【OK】５つのカードで、全部一桁' do

    end

    it '【OK】５つのカードで２桁の数字を含む' do

    end

    it '【NG】カードが５枚ではない' do

    end

    it '【NG】区切りが半角スペースではない' do

    end

    it '【NG】指定以外のスート' do

    end

    it '【NG】指定以外の数字' do

    end

    it '【NG】無関係の文字' do

    end

  end

  it 'valid?の結果がflashに引き渡されている' do

  end

  describe '役判定' do
    it 'ストレートフラッシュ' do

    end

    it 'フォー・オブ・ア・カインド' do

    end

    it 'フルハウス' do

    end
    it 'フラッシュ' do

    end

    it 'ストレート' do

    end
    it 'スリー・オブ・ア・カインド' do

    end

    it 'ツーペア' do

    end

    it 'ワンペア' do

    end

    it 'ハイカード' do

    end

    it '役判定結果がflashに引き渡されている' do

    end

  end

end