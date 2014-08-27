Rails.application.routes.draw do

  get '/gems', to: 'home#gems'
  get '/dash', to: 'home#dash'

  resources 'votes', only: :create

  root to: 'home#index'

end
