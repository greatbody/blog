Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Styleguide (development aid) - only enabled in non-production environments
  if Rails.env.development? || Rails.env.test?
    get "/styleguide", to: "styleguide#index"
  end

  # Defines the root path route ("/")
  root "posts#index"

  # Authentication routes
  get '/auth/github/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get '/logout', to: 'sessions#destroy'

  # Public posts routes
  get '/posts', to: 'posts#blog_index', as: :posts

  # Admin posts routes
  get '/admin/posts', to: 'posts#admin_index', as: :admin_posts
  get '/posts/new', to: 'posts#new', as: :new_post
  post '/posts', to: 'posts#create', as: :create_post
  get '/posts/:id/edit', to: 'posts#edit', as: :edit_post
  patch '/posts/:id', to: 'posts#update'
  put '/posts/:id', to: 'posts#update'
  delete '/posts/:id', to: 'posts#destroy', as: :delete_post

  # Individual post route (must come after specific routes)
  get '/posts/:id', to: 'posts#show', as: :post
end
