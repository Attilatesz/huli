Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

  # get 'drt', to: 'drts#new', as: 'drt'

  namespace :admins  do
    get 'dashboard', to: 'admin_applicant#dashboard', as: 'dashboard'
    get 'dashboard/:status', to: 'admin_applicant#dashboard_filter', as: 'applicant_status'
    get 'applicant/:id', to: 'admin_applicant#show', as: 'applicant'
    get 'decision/:status/:decision', to: 'admin_applicant#status_update', as: 'decision'
    post 'search', to: 'admin_applicant#search', as: 'applicant_search'
    resources :options, except: [:show, :index, :destroy],
                        path_names: { new: 'new/:category', edit: ':category' } do
      get ':category', to: 'options#filter', as: 'filter', on: :collection
      delete ':category/:id', to: 'options#destroy', as: 'destroy', on: :collection
    end
    # get 'drt', to: 'drts#new', as: 'drt'
    # post 'drt', to: 'drts#create', as: 'drt_new'
    resources :drts, only: [:new, :create], path_names: { new: '/', create:'new/'}
  end
  resources :applicants, except: [:edit, :destroy, :update, :show] do
  end
end
