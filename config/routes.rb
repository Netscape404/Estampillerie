Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'




  
  root    'pages#home'
  get     'pages/about'
  get     'pages/termsofservice'
  get     'pages/comingsoon'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
