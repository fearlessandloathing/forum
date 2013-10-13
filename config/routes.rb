Flforum::Application.routes.draw do

  root :to => "forum_threads#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users

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

end
