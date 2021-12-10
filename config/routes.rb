require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/jobs/push/:id', to: 'jobs#push'
  get '/jobs/perform/:id', to: 'jobs#perform'

  mount Sidekiq::Web => '/sidekiq'
end
