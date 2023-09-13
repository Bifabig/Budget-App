Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root to: 'groups#index', as: :authenticated_root
    end

    unauthenticated :user do
      root to: 'devise/sessions#splash', as: :unauthenticated_root
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :groups do
    resources :entities do
    end
  end
end
