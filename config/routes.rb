Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'

   devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  devise_scope :user do
    get '/company/new' => 'users/registrations#company' ,as: :new_company
  end

  scope module: :public do
    resources :posts do
      resources :favorites, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end

    # -------------DM機能------------
    resources :messages, only: [:create]
    resources :rooms, only: [:create,:show]
     # -------------DM機能------------
    resources :users, only: [:show, :edit, :update, :index] do
      resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
      member do
        get 'dms'
        get 'unsubscribe'
        patch 'withdraw'
      end
    end

  end



  # admin

  devise_for :admins, :controllers => {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }

   namespace :admin do
    resources :genres, only:[:index, :create, :edit, :update]
    resources :tags, only:[:index, :create, :edit, :update]
    resources :users, only:[:index, :edit, :update]
  end


end
