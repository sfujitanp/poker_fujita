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

  describe "POST #judge" do
    before do
      post :judge
    end
    let(:card_ok) {Card.new('S3 S4 S5 S6 S7')}
    let(:card_ng) {Card.new('S3 S4 S5 S6')}

    context 'バリデーションがOK' do
      it 'バリデーションがOKとなる' do
        expect(card_ok.valid?).to eq true
      end
      it 'ランクの結果が返却される' do
        card_ok.judge_rank
        expect(card_ok.rank_name).to eq "ストレートフラッシュ"
      end
    end

    context 'バリデーションがNG' do
      it 'バリデーションがNGとなる' do
        expect(card_ng.valid?).to eq false
      end
    end
  end

  describe "POST #judge with params" do
    it '400レスポンスを返す' do
      post :judge, params: { content: " "}
      expect(response.status).to eq 400
    end
    it 'topビューが描画されている' do
      post :judge, params: { content: " "}
      expect(response).to render_template(:top)
    end
    it '200レスポンスを返す' do
      post :judge, params: { content: "S3 S4 S5 S6 S7"}
      expect(response.status).to eq 200
    end
    it 'topビューが描画されている' do
      post :judge, params: { content: "S3 S4 S5 S6 S7"}
      expect(response).to render_template(:top)
    end
  end
end