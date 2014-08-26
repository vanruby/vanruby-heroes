Rails.application.routes.draw do
  root to: 'home#index'

  resources 'votes', only: :create
end
