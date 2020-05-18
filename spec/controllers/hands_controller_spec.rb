#require 'rails_helper'
require_relative '../rails_helper'
include Judge

RSpec.describe HandsController, type: :controller do

  describe "GET #top" do
    before do
      get :top
    end

    it '200レスポンスを返す' do
      expect(response.status).to eq 200
    end
    it 'topビューが描画されている' do
      expect(response).to render_template(:top)
    end
  end

  describe "POST #rule" do
    before do
      post :rule
    end

    let(:card_ok) {Card.new('S3 S4 S5 S6 S7')}
    let(:card_ng) {Card.new('S3 S4 S5 S6')}
    it '200レスポンスを返す' do
      expect(response.status).to eq 200
    end
    it 'cardインスタンスを作成できている' do
      expect(card_ok).to be_valid
    end

    context 'バリデーションがOK' do
      it 'バリデーションがOKとなる' do
        expect(card_ok.valid?).to eq true
      end
      it 'ランクの結果が返却される' do
      expect(card_ok.rank_judge).to eq "ストレートフラッシュ"
      end
    end

    context 'バリデーションがNG' do
      it 'バリデーションがNGとなる' do
        expect(card_ng.valid?).to eq false
      end
    end

    context 'hoge' do
    #let(:input){'S3 S4 S5 S6 S7'}
    it 'top画面で入力した内容をruleアクションでinputとして受け取っている' do
    #　実装方法を相談したい
    #  expect(flash[:notice]).to eq "ストレートフラッシュ"
    end
    end
   end
end