Rails.application.routes.draw do
  root 'tops#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :foods
  resources :users
  resources :bookmarks, only: [:create, :destroy, :show]
  resources :weight_histories
  resources :momentum_counts
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
