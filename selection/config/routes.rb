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

  scope '/admins' do
    get 'dashboard', to: 'admins#dashboard', as: 'admins_dashboard'
    get 'basic', to: 'admins#basic', as: 'admins_basic'
    get 'drt', to: 'admins#drt', as: 'admins_drt'
    get 'applicant/:id', to: 'admins#show', as: 'applicant_admin'
  end

  resources :applicants, except: [:edit, :destroy, :update, :show]
  resources :options
end
