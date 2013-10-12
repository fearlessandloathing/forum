Flforum::Application.routes.draw do
  resources :forum_threads

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end