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
    get 'dashboard/:status', to: 'admins#dashboard_filter', as: 'applicant_status'
    get 'applicant/:id', to: 'admins#show', as: 'applicant_admin'
    # resource :applicants, only: [:show] do
    #   get :status, to: 'admins#update_status', as: 'applicant_status'
    # end
  end

  resources :applicants, except: [:edit, :destroy, :update, :show]
  resources :options, except: [:show, :index, :destroy],
                      path_names: { new: 'new/:category',
                                    edit: ':category' }
  scope '/options' do
    get ':category', to: 'options#index', as: 'list_options'
    delete ':category/:id', to: 'options#destroy', as: 'delete_option'
  end
end

