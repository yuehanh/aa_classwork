Rails.application.routes.draw do
  resources :singers
    resources :notes
    resources :tracks, except: :new
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :users, only: %i[new create]
    resource :session, only: %i[new create destroy]

    # resources :bands do
    #     resources :albums, only: [:new]
    # end

    resources :albums
    # why do rails_service_blob etc. show up
end
