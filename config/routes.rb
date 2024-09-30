Rails.application.routes.draw do
  root 'links#index'

  resources :links, param: :slug, only: [:new, :create, :index, :show, :destroy] do
    collection do
      delete :destroy_all
    end
  end

  get '/redirect/:slug', to: 'links#redirect', as: :redirect
end
