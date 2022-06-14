Rails.application.routes.draw do
  root 'tops#index'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
    post 'users/admin_guest_sign_in', to: 'users/sessions#admin_guest_sign_in'
  end

  resources :foods
  resources :users
  resources :bookmarks, only: [:create, :destroy, :show]
  resources :weight_histories
  resources :momentum_counts

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
