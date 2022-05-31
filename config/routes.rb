Rails.application.routes.draw do
  devise_for :users
  resources :foods
  root 'foods#index'
  resources :users
  resources :bookmarks, only: [:create, :destroy, :show]
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
