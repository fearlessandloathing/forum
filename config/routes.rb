Flforum::Application.routes.draw do

  resources :forum_threads do
    resources :posts
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
