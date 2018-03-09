Rails.application.routes.draw do
  resources :notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # Skip sessions/registration to limit authentication to oauth
  # Signout and sign_in(GET/CREATE) need to be implemented separately.
  # :authenticate_user! redirects user to sign_in GET !
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' },
                     skip: %i[sessions registration]
  as :user do
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  resource :cv, only: [:new, :create, :edit, :update]
  resource :profile_picture, only: [:new, :create, :edit, :update]

  get 'welcome/profile'
  root 'welcome#index'

  namespace :admins  do
    get 'dashboard', to: 'applicants#dashboard', as: 'dashboard'
    get 'dashboard/:status', to: 'applicants#dashboard_filter', as: 'applicant_status'
    resources :applicants, except: [:edit, :index, :destroy, :new, :create, :update] do
      resources :comments
    end
    get 'decision/:status/:decision', to: 'applicants#status_update', as: 'decision'
    post 'search', to: 'applicants#search', as: 'applicant_search'
    resources :options, except: [:show, :index, :destroy],
    path_names: { new: 'new/:category', edit: ':category' } do
      get ':category', to: 'options#filter', as: 'filter', on: :collection
      delete ':category/:id', to: 'options#destroy', as: 'destroy', on: :collection
    end
    resources :drts, only: [:new, :create], path_names: { new: '/', create:'new/'}
    resources :interview, only: [:edit, :update, :new], path_names: { new: '/', create:'new/'}
  end
  resources :applicants, except: [:edit, :destroy, :update, :show] do
  end
end
