Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'
  resources :courses, only: %i[index show]
  resources :lessons, only: [:show]


  namespace :instructor do
    resources :sections, only: [] do
      resources :lessons, only: %i[new create]
    end
    resources :courses, only: %i[new create show] do
      resources :sections, only: %i[new create]
    end
  end
end
