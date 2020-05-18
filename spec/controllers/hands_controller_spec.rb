#require 'rails_helper'
require_relative '../rails_helper'
include Judge

RSpec.describe HandsController, type: :controller do

  describe "get #top" do
    before do
      get :top
    end

    it '正常にレスポンスを返す' do
      expect(response).to be_success
    end

    it '200レスポンスを返す' do
      expect(response.status).to eq 200
    end

  end

  describe "post #rule" do
    before do
      post :rule
    end

    it 'cardインスタンスを作成できている' do
      card = Card.new('S3 S4 S5 S6 S7')
      #expect(card).to be_valid
      expect(card).not_to be_nil
    end

    it 'top画面で入力した内容をruleアクションでinputとして受け取っている' do

    end
   end

end