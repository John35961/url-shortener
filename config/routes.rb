Rails.application.routes.draw do
  root 'links#index'

  resources :links, only: [:new, :create, :index]
  get '/links/:slug', to: 'links#show', as: :link

  get '/redirect/:slug', to: 'links#redirect', as: :redirect
end
