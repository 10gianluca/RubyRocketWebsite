Rails.application.routes.draw do
  devise_for :users
  #get 'home/index'
  root "home#index"
  get 'corporate', to:'home#corporate'
  get 'residential', to: 'home#residential'
  get 'form', to: 'home#form'
  get 'login', to: 'home#login'
  get 'admin', to: 'home#admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
