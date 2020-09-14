Rails.application.routes.draw do
    resources :posts, except: [:index, :new, :edit]
    resources :subs do
        resources :posts, only: [:new, :edit]
    end
    resource :session, only: %i[new create destroy]
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
