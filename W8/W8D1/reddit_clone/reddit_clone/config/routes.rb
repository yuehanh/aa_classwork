Rails.application.routes.draw do
    resources :comments, except: [:new, :show]
    resources :posts do    # , except: %i[index]
        resources :comments, only: [:new, :show]
    end
    resources :subs do
    end
    resource :session, only: %i[new create destroy]
    resources :users
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
