require 'rails_helper'


describe 'バリデーション' do

  it '【OK】５つのカードで、全部一桁' do
    card = Card.new('S3 S4 S5 S6 S7')
    expect(card.valid?).to eq true
  end

  it '【OK】５つのカードで２桁の数字を含む' do
    card = Card.new('S10 S11 S12 S13 S1')
    expect(card.valid?).to eq true
  end

  it '【NG】カードが５枚ではない' do
    card = Card.new('S3 S4 S5 S6')
    expect(card.valid?).to eq false
  end

  it '【NG】区切りが半角スペースではない' do
    card = Card.new('S3　S4　S5　S6　S7')
    expect(card.valid?).to eq false
  end

  it '【NG】指定以外のスート' do
    card = Card.new('A10 S11 S12 S13 S1')
    expect(card.valid?).to eq false
  end

  it '【NG】指定以外の数字' do
    card = Card.new('S0 S14 S12 S13 S1')
    expect(card.valid?).to eq false
  end

  it '【NG】無関係の文字' do
    card = Card.new('hoge')
    expect(card.valid?).to eq false
  end

  it '【NG】同じカードを含む' do
    card = Card.new('S11 S11 S12 S13 S1')
    expect(card.valid?).to eq false
  end
end


describe '役判定' do
  it 'ストレートフラッシュ' do
    card = Card.new('S10 S11 S12 S13 S1')
    expect(card.judge_rank).to eq "ストレートフラッシュ"
  end

  it 'フォー・オブ・ア・カインド' do
    card = Card.new('C10 D10 H10 S10 D5')
    expect(card.judge_rank).to eq "フォー・オブ・ア・カインド"
  end

  it 'フルハウス' do
    card = Card.new('S10 H10 D10 S4 D4')
    expect(card.judge_rank).to eq "フルハウス"
  end

  it 'フラッシュ' do
    card = Card.new('H1 H12 H10 H5 H3')
    expect(card.judge_rank).to eq "フラッシュ"
  end

  it 'ストレート' do
    card = Card.new('S8 S7 H6 H5 S4')
    expect(card.judge_rank).to eq "ストレート"
  end

  it 'スリー・オブ・ア・カインド' do
    card = Card.new('S12 C12 D12 S5 C3')
    expect(card.judge_rank).to eq "スリー・オブ・ア・カインド"
  end

  it 'ツーペア' do
    card = Card.new('H13 D13 C2 D2 H11')
    expect(card.judge_rank).to eq "ツーペア"
  end

  it 'ワンペア' do
    card = Card.new('C10 S10 S6 H4 H2')
    expect(card.judge_rank).to eq "ワンペア"
  end

  it 'ハイカード' do
    card = Card.new('D1 D10 S9 C5 C4')
    expect(card.judge_rank).to eq "ハイカード"
  end

end

