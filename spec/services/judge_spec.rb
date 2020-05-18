require 'rails_helper'


describe 'バリデーション' do

  it '【OK】５つのカードで、全部一桁' do
    card = Card.new('S3 S4 S5 S6 S7')
    expect(card).to be_valid
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

  it 'valid?の結果がflashに引き渡されている' do

  end


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

