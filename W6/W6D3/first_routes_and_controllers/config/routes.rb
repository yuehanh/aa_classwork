Rails.application.routes.draw do
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    # long format
    # get 'users/:id', to: 'users#show'
    
    resources :users, only: [:create, :destroy, :index, :show, :update]
    resources :artworks, only: [:create, :destroy, :index, :show, :update]
end
