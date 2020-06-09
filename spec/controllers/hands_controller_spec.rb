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

  describe "POST #judge with params" do
    context '有効な手札の場合' do
      it '200レスポンスを返す' do
        post :judge, params: {content: "S3 S4 S5 S6 S7"}
        expect(response.status).to eq 200
      end
      it 'topビューが描画されている' do
        post :judge, params: {content: "S3 S4 S5 S6 S7"}
        expect(response).to render_template(:top)
      end
    end
    context '無効な手札の場合' do
      it '400レスポンスを返す' do
        post :judge, params: {content: " "}
        expect(response.status).to eq 400
      end
      it 'topビューが描画されている' do
        post :judge, params: {content: " "}
        expect(response).to render_template(:top)
      end
    end
  end
end