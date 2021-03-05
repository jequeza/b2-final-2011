Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flights, only: [:index, :show]

  resources :flight_passangers, only: [:destroy]
  resources :patients, only: [:index]
end
