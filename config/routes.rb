Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get '/my_board', controller: :dashboard, action: :index, as: :board

  namespace :api do
    resources :listings, only: %i[index create]
    resource :users
  end

  devise_for :user, only: %i[sessions registrations]

  devise_scope :user do
    authenticated { root to: redirect('my_board') }

    unauthenticated { root to: 'devise/sessions#new', as: :unauthenticated_root }
  end
end
