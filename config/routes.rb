Flforum::Application.routes.draw do

  get "landingpage/index"
  get "moderation/index"
  get "pseudonym/show"
  root :to => "forum_threads#index"
  devise_scope :user do
    get "/users/confirm", to: "registrations#confirm"
  end
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users


  get '/pseudo/:pseudonym', to: "pseudonym#show"

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
