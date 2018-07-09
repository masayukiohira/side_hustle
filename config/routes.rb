Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#show'

  devise_for :admins, :controllers  => {
  	:registrations => 'admins/registrations',
  	:sessions => 'admins/sessions',
    :passwords => 'admins/passwords'
  }

  devise_for :users, :controllers => {
  	:registrations => 'users/registrations',
  	:sessions  => 'users/sessions',
    :passwords => 'users/passwords'
  }

  get 'top/start' => 'top#start', as: 'start_top'
  get 'top/taxreturn' => 'top#taxreturn', as: 'taxreturn_top'
  get 'top/about' => 'top#about', as: 'about_top'
  get 'top/confirm' => 'top#confirm', as: 'confirm_top'
  get 'top/restricted' => 'top#restricted', as: 'restricted_top'

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resource :follows, only: [:create, :destroy]
    get :favorites, on: :member
    get :follows, on: :member
    get :followers, on: :member
    get :messages, on: :member
    get :unsubscribe, on: :member
  end

  resources :posts, except: [:edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resource :likes, only: [:create, :destroy]
    resource :comments, only: [:new, :create, :destroy]
    resource :reports, only: [:new, :create]
    get :timeline, on: :collection
    get :likes, on: :member
    get :comments, on: :member
    get :search, on: :collection
    get :category, on: :collection
  end

  mount ActionCable.server => '/cable'

  namespace :admins do
    root 'top#start'
  	resources :users, only: [:index, :edit, :update] do
      get :unsubscribe, on: :collection
    end
    resources :posts, only: [:index, :show]
    resources :reports, only: [:index, :show]
  end
end
