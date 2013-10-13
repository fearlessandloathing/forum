Flforum::Application.routes.draw do

  resources :forum_threads do
    member do
      get 'complain'
    end
    resources :posts do
      member do
        get 'complain'
      end
    end
  end

  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
end
