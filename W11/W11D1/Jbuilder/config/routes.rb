Rails.application.routes.draw do
  # Your routes here!

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resources :gifts, only: %i[show]
    resources :guests, only: %i[index show] do 
      resources :gifts, only: [:index]
    end
    resources :parties, only: %i[index show]
  end
end
