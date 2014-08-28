Rails.application.routes.draw do

  get '/gems', to: 'home#gems'
  get '/dash', to: 'home#dash'
  get "/results-#{ENV['RESULTS_TOKEN']}", to: 'home#results'

  resources 'votes', only: :create

  root to: 'home#index'

end
