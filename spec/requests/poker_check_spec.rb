
require 'rails_helper'

RSpec.describe "Check", type: :request do
  describe "POST /api/vi/cards/check" do
    context '有効なパラメータの場合（同じ強度の役がない）' do
      before do
        cards = {"cards": ["H1 H3 H12 H11 H10", "H9 C9 S9 H2 C2", "C12 C3 H8 H7 D12"]}
        post '/api/v1/poker/check', params: cards
      end

      it 'リクエストは201 Createdとなること' do
        expect(response.status).to eq 201
      end

      it '期待する役および最も強い手札が判定されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body["result"][0]["card"]).to eq 'H1 H3 H12 H11 H10'
        expect(json_body["result"][0]["hand"]).to eq 'フラッシュ'
        expect(json_body["result"][0]["best"]).to eq false
        expect(json_body["result"][1]["card"]).to eq 'H9 C9 S9 H2 C2'
        expect(json_body["result"][1]["hand"]).to eq 'フルハウス'
        expect(json_body["result"][1]["best"]).to eq true
        expect(json_body["result"][2]["card"]).to eq 'C12 C3 H8 H7 D12'
        expect(json_body["result"][2]["hand"]).to eq 'ワンペア'
        expect(json_body["result"][2]["best"]).to eq false
      end

    end

    context '有効なパラメータの場合（同じ強度の役がある）' do
      before do
        cards = {"cards": ["H9 C9 S9 H2 C2", "H9 C9 S9 H2 C2", "C12 C3 H8 H7 D12"]}
        post '/api/v1/poker/check', params: cards
      end

      it 'リクエストは201 Createdとなること' do
        expect(response.status).to eq 201
      end

      it '期待する役および最も強い手札が判定されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body["result"][0]["card"]).to eq 'H9 C9 S9 H2 C2'
        expect(json_body["result"][0]["hand"]).to eq 'フルハウス'
        expect(json_body["result"][0]["best"]).to eq true
        expect(json_body["result"][1]["card"]).to eq 'H9 C9 S9 H2 C2'
        expect(json_body["result"][1]["hand"]).to eq 'フルハウス'
        expect(json_body["result"][1]["best"]).to eq true
        expect(json_body["result"][2]["card"]).to eq 'C12 C3 H8 H7 D12'
        expect(json_body["result"][2]["hand"]).to eq 'ワンペア'
        expect(json_body["result"][2]["best"]).to eq false
      end

    end

    context '無効なパラメータの場合' do
      before do
        invalid_cards = {"cards": ["C7 C6 C5 C4 C3 C2", "D1 D10 S9 C5 C", "D1 D10 S9 C5 C5"]}
        post '/api/v1/poker/check', params: invalid_cards
      end

      it 'リクエストは201 Createdとなること' do
        expect(response.status).to eq 201
      end

      it '期待するエラーメッセージが格納されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body["error"][0]["card"]).to eq 'C7 C6 C5 C4 C3 C2'
        expect(json_body["error"][0]["msg"]).to eq '5つのカード指定文字を半角スペース区切りで入力してください。'
        expect(json_body["error"][1]["card"]).to eq 'D1 D10 S9 C5 C'
        expect(json_body["error"][1]["msg"]).to eq '5番目のカード指定文字が不正です。(C)　'
        expect(json_body["error"][2]["card"]).to eq 'D1 D10 S9 C5 C5'
        expect(json_body["error"][2]["msg"]).to eq 'カードが重複しています'
      end

    end

    context '不正なリクエストの場合' do
      before do
        invalid_requst =  {"hoge": ["H1 H3 H12 H11 H10", "H9 C9 S9 H2 C2", "C12 C3 H8 H7 D12"]}
        post '/api/v1/poker/check', params: invalid_requst
      end

      it 'リクエストは400 Bad Requestとなる' do
        expect(response.status).to eq(400)
      end

      it '期待するエラーメッセージが格納されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body["error"]).to eq('400 Bad Request：不正なリクエストです')
      end
    end

    context '不正なURLの場合' do
      before do
        cards = {"cards": ["H1 H3 H12 H11 H10", "H9 C9 S9 H2 C2", "C12 C3 H8 H7 D12"]}
        post '/api/v1/poker', params: cards
      end

      it 'リクエストは404 Not Foundとなること' do
        expect(response.status).to eq 404
      end

      it '期待するエラーメッセージが格納されていること' do
        json_body = JSON.parse(response.body)
        expect(json_body["error"]).to eq '404 Not Found：指定されたURLは存在しません'
      end

    end

  end
end
