Rails.application.routes.draw do
  mount ActionCable.server => '/cable' #Action Cableの有効化
  root to: 'rooms#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
