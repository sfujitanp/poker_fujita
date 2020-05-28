module API
  module Ver1
    class Root < Grape::API
      # http://localhost:3000/api/v1/
      version 'v1'
      format :json

      # 400 Bad Request
      rescue_from Grape::Exceptions::Base do
        error!({error: "400 Bad Request：不正なリクエストです"}, 400)
      end

      # 404 Not Found
      route :any, '*path' do
        error!({error: "404 Not Found：指定されたURLは存在しません"}, 404)
      end

      # 500 Internal Server Error
      rescue_from Exception do
        error!({error: "500 Internal Server Error：予期しないエラーです"}, 500)
      end


      mount API::Ver1::Poker
    end
  end
end