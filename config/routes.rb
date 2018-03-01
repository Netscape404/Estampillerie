Rails.application.routes.draw do
  resources :subcategories
  resources :categories
  mount Ckeditor::Engine => '/ckeditor'

  devise_for :users, controllers: {
          sessions: 'users/sessions',
          registrations: 'users/registrations'
        }

  resources :users

  root    'pages#home'
  get     'pages/about'
  get     'pages/termsofservice'
  get     'pages/comingsoon'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
