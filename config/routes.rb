Rails.application.routes.draw do
  post 'hands/judge' => "hands#judge"
  get '/' => "hands#top"
  mount API::Root => "/"
end
