Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
        }
  resources :users

  resources :projects do
    resources :comments
  end

  resources :tags
  resources :categories
  resources :subcategories

  resources :tutorials
  resources :articles

  match '/contacts', to: 'contacts#new', via: 'get'
  resources "contacts", only: [:new, :create]

  root    'pages#home'
  get     'pages/about'
  get     'pages/termsofservice'
  get     'pages/comingsoon'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
