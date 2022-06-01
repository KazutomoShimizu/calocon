Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :foods
  root 'foods#index'
  resources :users
  resources :bookmarks, only: [:create, :destroy, :show]
  resources :weight_histories
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
