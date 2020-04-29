Rails.application.routes.draw do
  post 'hands/rule' => "hands#rule"
  get 'home/top'
  post "home/check" => "home#check"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
