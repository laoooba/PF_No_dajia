Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'public/homes#top'
  
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
