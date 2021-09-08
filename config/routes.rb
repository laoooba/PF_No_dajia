Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'

  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      member do
        get 'unsubscribe'
        patch 'withdraw'
      end 
    end 
    
  end




  devise_scope :user do
    get '/company/new' => 'users/registrations#company' ,as: :new_company
  end
  devise_for :users, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'

  }


  # admin

  devise_for :admins, :controllers => {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords'
  }


end
