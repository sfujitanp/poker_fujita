Rails.application.routes.draw do
  post 'hands/rule' => "hands#rule"
  get '/' => "hands#top"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
