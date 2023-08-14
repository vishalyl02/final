Rails.application.routes.draw do
  get 'subscriptions/new'
  get 'subscriptions/create'
  get '/current_user', to: 'current_user#index'
  devise_for :users, path:'' , path_names:{
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    articles: 'articles'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/articles', to: "articles#home"

  post 'create', to: "articles#create"

  get 'subscription_success', to: 'subscriptions#success'

  post '/registration', to: 'registration#create'

  post '/check', to: 'check#check'

  delete 'delete', to: "articles#delete"

  get 'search', to: "articles#search"

  put 'update', to: "articles#update"

  get 'like', to: "articles#like"
  get 'comment', to: "articles#comment"

  get 'by_topic', to: "articles#articles_by_topic"

  get 'top_posts', to: "articles#top_posts"

  get 'recommended_posts', to: "articles#recommended_posts"

  get 'save_for_later', to: "articles#save_for_later"

  get 'drafts', to: "articles#drafts"

  get 'revisions', to: "articles#revisions"

  # route for follow and unfollow
  resources :profiles, only: [:show] do
    member do
      post 'follow'
      delete 'unfollow'
    end
    collection do
      get :my_profile
      post :create_profile
    end
  end


  resources :subscriptions, only: [:new, :create]

  namespace :api do
    resources :blogs, only: [:index]
  end

  namespace :api do
    resources :topics, only: [:index, :show]
  end


  resources :playlists, only: [:index, :create, :show] do
    member do
      post 'share'
    end
  end
  post 'playlists/add_article', to: 'playlists#add_article'


end
